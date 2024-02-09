import cv2
import numpy as np


image = cv2.imread('lenna.png')

degraded_image = cv2.blur(image, (5, 5))

noise = np.random.normal(0, 0.1, image.shape)
noisy_image = degraded_image + noise

filtered_image = cv2.filter2D(noisy_image, -1, np.linalg.inv(cv2.boxFilter(np.eye(image.shape[0], image.shape[1]), -1, np.float32)))

cv2.imshow('Original Image', image)
cv2.imshow('Degraded Image', degraded_image)
cv2.imshow('Noisy Image', noisy_image)
cv2.imshow('Filtered Image', filtered_image)
cv2.waitKey(0)
cv2.imwrite('degraded_image.jpg', degraded_image)
cv2.imwrite('noisy_image.jpg', noisy_image)
cv2.imwrite('filtered_image.jpg', filtered_image)