import cv2
import os
import torch
import numpy as np
import easyocr
import DBmanager as db
import matplotlib.pyplot as plt
import pytesseract
import time
import re

while True :
    #모델 열기
    model = torch.hub.load('C:\AI_Parking_System/yolov5',
                           'custom', 
                           path='C:\AI_Parking_System\yolov5\runs\train\numberplate_results\weights\best.pt', 
                           source='local')  # local repo
    
    #db연결
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "sps", "root", "ezen") == False :
        print("ERROR")
    sql = f"select * from exitpic where carnum = 'N'" 
    dbms.OpenQuery(sql)
    # 전체 데이터 갯수
    total = dbms.GetTotal()
    print("Null 데이터 갯수 : ", total)
    # cmno의 목록
    cmno = []
    for i in range(0,total):
        print("i : ", i)
        cmno.append(dbms.GetValue(i, "cmno"))
        
    dbms.DBClose()

    #이미지 열기
    #자동차관리번호 받아서 이미지 가져오는 함수
    def getExitpic(cmno) :
        dbms = db.DBmanager() 
        if dbms.DBOpen("192.168.0.101", 3306, "sps", "root", "ezen") == False :
            print("ERROR")
            return False
        sql = f"select * from exitpic where cmno = {cmno}"
        #print(sql)
        dbms.OpenQuery(sql)
        enterpic = dbms.GetValue(0, "exitpic")
        
        return enterpic
    
    #print(cmno)
    for j in cmno :
        #print(j)
        exitpic = getExitpic(j)
        #enterpic, cmno, carnum = getEnterpic(i)
        print("cmno : ", j)
        print("exitpic : ", exitpic)
        
        print("이미지 식별")
        #img = 'C:/Cars54_png.rf.7bebc242d7c76deefe82f76176ab3d74.jpg'
        path = 'C:/Users/502-20/git/smart-parking-lot/SPS01/src/main/webapp/upload/'
        img = path + exitpic
        print("경로 : ",img)
        
        img = cv2.imread(img)
        
        #예측
        results = model(img)
        
        # 결과
        results.show()
        results.print()
        results.pandas()
      
        #앵커박스 좌표 구하기
        xyxy_coordinates = results.xyxy[0][:, :4].cpu().numpy()
        #print("Anchor Box Coordinates:")
        #print(xyxy_coordinates)
        x_min = xyxy_coordinates[0][0] #xmin
        y_min = xyxy_coordinates[0][1] #ymin
        x_max = xyxy_coordinates[0][2] #xmax
        y_max = xyxy_coordinates[0][3] #ymax
        #print("=" * 60)
        
        
        #pandas로 좌표보기
        #xyxy = results.pandas().xyxy[0]
        #print("Anchor Box pandas:")
        #print(xyxy)
        
        x = int(x_min)
        y = int(y_min)
        w = int(x_max-x_min)
        h = int(y_max-y_min)
        
        #print(x)
        #print(y)
        #print(w)
        #print(h)
        #print(img)
        img_trim = img[y:y+h, x:x+w]
        #print(img_trim)
        
        #사진 앵커박스 만큼 잘라서 저장
        cv2.imwrite('numberplate' + str(j) + '.jpg', img_trim)
        
        #사진 새창으로 열기
        org_image = cv2.imread('numberplate' + str(j) + '.jpg')
        #cv2.imshow('org_image', org_image)
        #cv2.waitKey(0)
        cv2.destroyAllWindows()
        
        plt.style.use('dark_background')
        
        # 입력 이미지
        path = 'C:/AI_Parking_System/'
        img = 'numberplate' + str(j) + '.jpg'
        imgpath = path + img
        print("경로 : " ,imgpath)
        img_ori = cv2.imread(imgpath)
              
        img_ori = cv2.resize(img_ori, (500,120))
        
        height, width, channel = img_ori.shape
        
        plt.figure(figsize=(12,10))
        plt.imshow(img_ori, cmap='gray')
        
        # 1.이미지 변환
        gray = cv2.cvtColor(img_ori, cv2.COLOR_BGR2GRAY)
        plt.figure(figsize=(12,10))
        plt.imshow(gray, cmap='gray')
        
        # 2-1.이미지 전처리(가우시안 블러 적용)
        img_blurred = cv2.GaussianBlur(gray, ksize=(5,5), sigmaX=0)
        
        plt.figure(figsize=(12,10))
        plt.imshow(img_blurred, cmap='gray')
        
        # 2-2.이미지 전처리(Threshold)
        img_thresh = cv2.adaptiveThreshold(
            img_blurred,
            maxValue=255.0,
            adaptiveMethod=cv2.ADAPTIVE_THRESH_GAUSSIAN_C,
            thresholdType=cv2.THRESH_BINARY_INV,
            blockSize=19,
            C=9
            )
        
        plt.figure(figsize=(12, 10))
        plt.imshow(img_thresh, cmap='gray')
        
        
        # 3.컨투어(Contours) 찾기
        contours, _ = cv2.findContours(
            img_thresh, 
            mode=cv2.RETR_LIST, 
            method=cv2.CHAIN_APPROX_SIMPLE
        )
        
        temp_result = np.zeros((height, width, channel), dtype=np.uint8)
        
        cv2.drawContours(temp_result, contours, -1, color=(255, 255, 255))
        
        plt.figure(figsize=(12, 10))
        plt.imshow(temp_result)
        
        
        
        
        # 4.데이터 준비하기
        temp_result = np.zeros((height, width, channel), dtype=np.uint8)
        
        contours_dict = []
        
        for contour in contours:
            x,y,w,h = cv2.boundingRect(contour)
            cv2.rectangle(temp_result, pt1=(x,y), pt2=(x+w, y+h), color=(255,255,255), thickness=2)
            
            contours_dict.append({
                'contour':contour,
                'x': x,
                'y': y,
                'w': w,
                'h': h,
                'cx' :x + (w/2),
                'cy' :y + (h/2)
                })
            
        plt.figure(figsize=(12,10))
        plt.imshow(temp_result, cmap='gray')
        
        
        
        # 5.적절한 컨투어 찾기
        MIN_AREA = 0
        MIN_WIDTH, MIN_HEIGHT = 0, 0
        MIN_RATIO, MAX_RATIO = 0.4, 1.4
        
        
        possible_contours = []
        
        cnt = 0
        for d in contours_dict:
            area  = d['w']*d['h']
            ratio = d['w']/d['h']
            
            if area > MIN_AREA \
            and d['w'] > MIN_WIDTH and d['h'] > MIN_HEIGHT \
            and MIN_RATIO < ratio < MAX_RATIO:
                d['idx'] = cnt
                cnt += 1
                possible_contours.append(d)
        
        
        # 6.번호판이 가능한 컨투어 시각화
        temp_result = np.zeros((height, width, channel), dtype=np.uint8)
        
        for d in possible_contours:
            cv2.rectangle(temp_result, pt1=(d['x'], d['y']), pt2=(d['x']+d['w'], d['y']+d['h']),
                          color=(255,255,255), thickness=2)
            
        plt.figure(figsize=(12,10))
        plt.imshow(temp_result, cmap='gray')
        
        
        
        # 7.컨투어의 배열에 따라 후보를 선택 (나란히 배열된 번호 찾기)
        #MAX_DIAG_MULTIPLYER = 5     #첫번째 컨투어의 대각선 길이의 5배 이하 길이
        #MAX_ANGLE_DIFF = 10.0       #컨투어와 컨투어의 중심을 이었을 때 그려지는 삼각형의 각도
        #MAX_AREA_DIFF = 0.5         #컨투어 면적 차이
        #MAX_WIDTH_DIFF = 0.45        #컨투어의 너비 차이
        #MAX_HEIGHT_DIFF = 0.5       #컨투어의 높이 차이
        #MIN_N_MATCHED = 13         #후보군 중에 위의 조건을 만족하는 컨투어가 3개 이하면 번호판으로 인정하지 않음
        
        
        
        MAX_DIAG_MULTIPLYER = 5 # 5
        MAX_ANGLE_DIFF = 12.0 # 12.0
        MAX_AREA_DIFF = 0.5 # 0.5
        MAX_WIDTH_DIFF = 2
        MAX_HEIGHT_DIFF = 2
        MIN_N_MATCHED = 7 # 3
        time.sleep(10)
    
    
    def find_chars(contour_list):
        matched_result_idx = []
        
        for d1 in contour_list:
            matched_contours_idx = []
            for d2 in contour_list:
                if d1['idx'] == d2['idx']:
                    continue
    
                dx = abs(d1['cx'] - d2['cx'])
                dy = abs(d1['cy'] - d2['cy'])
    
                diagonal_length1 = np.sqrt(d1['w'] ** 2 + d1['h'] ** 2)
    
                distance = np.linalg.norm(np.array([d1['cx'], d1['cy']]) - np.array([d2['cx'], d2['cy']]))
                if dx == 0:
                    angle_diff = 90
                else:
                    angle_diff = np.degrees(np.arctan(dy / dx))
                area_diff = abs(d1['w'] * d1['h'] - d2['w'] * d2['h']) / (d1['w'] * d1['h'])
                width_diff = abs(d1['w'] - d2['w']) / d1['w']
                height_diff = abs(d1['h'] - d2['h']) / d1['h']
    
                if distance < diagonal_length1 * MAX_DIAG_MULTIPLYER \
                and angle_diff < MAX_ANGLE_DIFF and area_diff < MAX_AREA_DIFF \
                and width_diff < MAX_WIDTH_DIFF and height_diff < MAX_HEIGHT_DIFF:
                    matched_contours_idx.append(d2['idx'])
    
            # append this contour
            matched_contours_idx.append(d1['idx'])
    
            if len(matched_contours_idx) < MIN_N_MATCHED:
                continue
    
            matched_result_idx.append(matched_contours_idx)
    
            unmatched_contour_idx = []
            for d4 in contour_list:
                if d4['idx'] not in matched_contours_idx:
                    unmatched_contour_idx.append(d4['idx'])
    
            unmatched_contour = np.take(possible_contours, unmatched_contour_idx)
            
            # recursive
            recursive_contour_list = find_chars(unmatched_contour)
            
            for idx in recursive_contour_list:
                matched_result_idx.append(idx)
    
            break
    
        return matched_result_idx
        
    result_idx = find_chars(possible_contours)
    
    matched_result = []
    for idx_list in result_idx:
        matched_result.append(np.take(possible_contours, idx_list))
    
    # visualize possible contours
    temp_result = np.zeros((height, width, channel), dtype=np.uint8)
    
    for r in matched_result:
        for d in r:
    #         cv2.drawContours(temp_result, d['contour'], -1, (255, 255, 255))
            cv2.rectangle(temp_result, pt1=(d['x'], d['y']), pt2=(d['x']+d['w'], d['y']+d['h']), color=(255, 255, 255), thickness=2)
    
    plt.figure(figsize=(12, 10))
    plt.imshow(temp_result, cmap='gray')
    
    
    PLATE_WIDTH_PADDING = 1.4
    PLATE_HEIGHT_PADDING = 1.5
    MIN_PLATE_RATIO = 3
    MAX_PLATE_RATIO = 10
    
    
    plate_imgs = []
    plate_infos = []
    
    for i, matched_chars in enumerate(matched_result):
        sorted_chars = sorted(matched_chars, key=lambda x: x['cx'])
    
        plate_cx = (sorted_chars[0]['cx'] + sorted_chars[-1]['cx']) / 2
        plate_cy = (sorted_chars[0]['cy'] + sorted_chars[-1]['cy']) / 2
        
        plate_width = (sorted_chars[-1]['x'] + sorted_chars[-1]['w'] - sorted_chars[0]['x']) * PLATE_WIDTH_PADDING
        
        sum_height = 0
        for d in sorted_chars:
            sum_height += d['h']
    
        plate_height = int(sum_height / len(sorted_chars) * PLATE_HEIGHT_PADDING)
        
        triangle_height = sorted_chars[-1]['cy'] - sorted_chars[0]['cy']
        triangle_hypotenus = np.linalg.norm(
            np.array([sorted_chars[0]['cx'], sorted_chars[0]['cy']]) - 
            np.array([sorted_chars[-1]['cx'], sorted_chars[-1]['cy']])
        )
        
        # 삼각형 높이가 0이 되는 경우를 처리합니다.
        if triangle_hypotenus == 0:
            continue
        
        angle = np.degrees(np.arcsin(triangle_height / triangle_hypotenus))
        
        rotation_matrix = cv2.getRotationMatrix2D(center=(plate_cx, plate_cy), angle=angle, scale=1.0)
        
        img_rotated = cv2.warpAffine(img_thresh, M=rotation_matrix, dsize=(width, height))
        
        img_cropped = cv2.getRectSubPix(
            img_rotated, 
            patchSize=(int(plate_width), int(plate_height)), 
            center=(int(plate_cx), int(plate_cy))
        )
        
        # 이미지의 가로 세로 비율이 지정한 범위 내에 있지 않으면 건너뜁니다.
        if not (MIN_PLATE_RATIO < img_cropped.shape[1] / img_cropped.shape[0] < MAX_PLATE_RATIO):
            continue
        
        plate_imgs.append(img_cropped)
        plate_infos.append({
            'x': int(plate_cx - plate_width / 2),
            'y': int(plate_cy - plate_height / 2),
            'w': int(plate_width),
            'h': int(plate_height)
        })
        
        plt.subplot(len(matched_result), 1, i+1)
        plt.imshow(img_cropped, cmap='gray')
    
    # 10. 추린 후보군을 이용하여 글자를 찾는다.
    longest_idx, longest_text = -1, 0
    plate_chars = []
    
    for i, plate_img in enumerate(plate_imgs):
        plate_img = cv2.resize(plate_img, dsize=(0, 0), fx=1.2, fy=1.2)
        _, plate_img = cv2.threshold(plate_img, thresh=0.0, maxval=255.0, type=cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        
        # find contours again (same as above)
        
        contours, _ = cv2.findContours(plate_img, mode=cv2.RETR_LIST, method=cv2.CHAIN_APPROX_SIMPLE)
        
        plate_min_x, plate_min_y = plate_img.shape[1], plate_img.shape[0]
        plate_max_x, plate_max_y = 0, 0
    
        for contour in contours:
            x, y, w, h = cv2.boundingRect(contour)
            
            area = w * h
            ratio = w / h
    
            if area > MIN_AREA \
            and w > MIN_WIDTH and h > MIN_HEIGHT \
            and MIN_RATIO < ratio < MAX_RATIO:
                if x < plate_min_x:
                    plate_min_x = x
                if y < plate_min_y:
                    plate_min_y = y
                if x + w > plate_max_x:
                    plate_max_x = x + w
                if y + h > plate_max_y:
                    plate_max_y = y + h
                    
        img_result = plate_img[plate_min_y:plate_max_y, plate_min_x:plate_max_x]
        
        img_result = cv2.GaussianBlur(img_result, ksize=(1, 1), sigmaX=0)
        _, img_result = cv2.threshold(img_result, thresh=0.0, maxval=255.0, type=cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        img_result = cv2.copyMakeBorder(img_result, top=10, bottom=10, left=10, right=10, borderType=cv2.BORDER_CONSTANT, value=(0,0,0))
    
        pytesseract.pytesseract.tesseract_cmd = 'C:\Program Files\Tesseract-OCR/tesseract.exe'
        chars = pytesseract.image_to_string(img_result, lang='kor', config='--psm 6 --oem 1')
        
        result_chars = ''
        has_digit = False
        for c in chars:
            if ord('가') <= ord(c) <= ord('힣') or c.isdigit():
                if c.isdigit():
                    has_digit = True
                result_chars += c
        
        print(result_chars)
        plate_chars.append(result_chars)
    
        if has_digit and len(result_chars) > longest_text:
            longest_idx = i
    
        plt.subplot(len(plate_imgs), 1, i+1)
        plt.imshow(img_result, cmap='gray')
        
        cv2.imwrite('result' + str(j) + '.jpg', img_result)
    
    
    def easy_ocr (path) :
        reader = easyocr.Reader(['ko','en'], gpu=True)
        result = reader.readtext(path)
        read_result = result[0][1]
        read_confid = int(round(result[0][2], 2) * 100)
        print("===== Crop Image OCR Read - Easy ======")
        print(f'Easy OCR 결과     : {read_result}')
        print("=======================================")
        result = read_result.replace(" ","")
        result = re.sub(r"[^\uAC00-\uD7A30-9a-zA-Z\s]", "", result)
        #print(result)
        dbms = db.DBmanager() 
        
        if dbms.DBOpen("192.168.0.101", 3306, "sps", "root", "ezen") == False :
           print("ERROR")
           return False
        sql = "update carinfo set exitpic = '" + exitpic + "',exittime = now() where carnum = '" + result + "'"
        print(sql)
        dbms.RunSql( sql )
        dbms.DBClose()
        
    print(i)
    easy_ocr('result' + str(j) + '.jpg')
    time.sleep(10)

