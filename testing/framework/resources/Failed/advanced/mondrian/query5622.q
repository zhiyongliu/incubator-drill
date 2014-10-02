select time_by_day.the_year as c0, time_by_day.quarter as c1, time_by_day.month_of_year as c2, customer.customer_id as c3, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter in ('Q1', 'Q4') and time_by_day.month_of_year in (2, 3, 10) and sales_fact_1997.customer_id = customer.customer_id and customer.customer_id in (2, 8, 9, 24, 42, 52, 57, 67, 72, 90, 94, 97, 98, 108, 113, 114, 141, 144, 145, 146, 147, 155, 156, 201, 211, 218, 223, 237, 241, 242, 245, 249, 262, 309, 310, 327, 330, 337, 344, 353, 358, 362, 368, 382, 389, 397, 401, 410, 414, 437, 444, 455, 519, 522, 537, 539, 540, 542, 567, 568, 585, 590, 615, 627, 632, 640, 671, 677, 703, 724, 732, 759, 762, 787, 794, 799, 800, 804, 807, 821, 824, 832, 855, 858, 869, 875, 876, 911, 915, 920, 925, 931, 938, 952, 954, 959, 969, 974, 1000, 1001, 1025, 1026, 1029, 1047, 1061, 1065, 1067, 1072, 1092, 1096, 1116, 1117, 1120, 1135, 1164, 1177, 1199, 1213, 1217, 1219, 1225, 1227, 1231, 1239, 1262, 1278, 1288, 1292, 1307, 1315, 1324, 1326, 1335, 1349, 1365, 1367, 1383, 1393, 1394, 1400, 1411, 1422, 1424, 1431, 1441, 1443, 1448, 1475, 1478, 1480, 1482, 1487, 1489, 1496, 1501, 1502, 1519, 1526, 1542, 1552, 1563, 1566, 1581, 1662, 1663, 1670, 1672, 1674, 1691, 1719, 1735, 1746, 1749, 1767, 1778, 1792, 1799, 1806, 1814, 1830, 1840, 1843, 1863, 1873, 1875, 1877, 1880, 1881, 1888, 1936, 1946, 1951, 1952, 1958, 1975, 1976, 1998, 2012, 2017, 2018, 2025, 2027, 2029, 2030, 2048, 2066, 2069, 2079, 2080, 2087, 2113, 2114, 2115, 2121, 2125, 2161, 2162, 2176, 2191, 2209, 2219, 2239, 2247, 2253, 2273, 2286, 2315, 2316, 2323, 2336, 2353, 2354, 2364, 2369, 2370, 2391, 2394, 2400, 2401, 2402, 2403, 2410, 2416, 2432, 2440, 2462, 2463, 2464, 2480, 2485, 2486, 2489, 2497, 2498, 2504, 2505, 2532, 2537, 2545, 2564, 2585, 2593, 2595, 2597, 2603, 2604, 2615, 2631, 2649, 2653, 2671, 2679, 2718, 2721, 2726, 2728, 2730, 2743, 2752, 2753, 2754, 2755, 2785, 2786, 2796, 2802, 2804, 2826, 2849, 2855, 2868, 2883, 2892, 2898, 2911, 2937, 2959, 2995, 3002, 3007, 3023, 3026, 3029, 3035, 3043, 3050, 3056, 3084, 3088, 3089, 3090, 3091, 3096, 3123, 3136, 3151, 3162, 3167, 3195, 3206, 3230, 3259, 3280, 3284, 3290, 3303, 3315, 3324, 3329, 3330, 3332, 3335, 3342, 3365, 3371, 3377, 3378, 3383, 3391, 3396, 3398, 3406, 3444, 3450, 3475, 3482, 3489, 3496, 3507, 3519, 3525, 3530, 3535, 3542, 3544, 3553, 3554, 3566, 3575, 3578, 3598, 3600, 3610, 3616, 3618, 3624, 3625, 3638, 3644, 3648, 3657, 3659, 3723, 3724, 3741, 3760, 3784, 3785, 3812, 3818, 3833, 3835, 3841, 3843, 3851, 3871, 3880, 3881, 3885, 3901, 3913, 3919, 3926, 3947, 3949, 3967, 3972, 3978, 3991, 3995, 4002, 4014, 4023, 4033, 4034, 4037, 4043, 4044, 4046, 4058, 4073, 4097, 4101, 4111, 4119, 4128, 4130, 4144, 4159, 4187, 4195, 4213, 4214, 4260, 4264, 4266, 4286, 4308, 4313, 4317, 4335, 4336, 4343, 4360, 4381, 4399, 4406, 4408, 4409, 4432, 4455, 4475, 4478, 4492, 4504, 4509, 4549, 4559, 4586, 4598, 4601, 4603, 4624, 4646, 4652, 4653, 4718, 4741, 4745, 4747, 4753, 4754, 4766, 4786, 4789, 4793, 4795, 4796, 4806, 4823, 4826, 4870, 4888, 4895, 4924, 4933, 4936, 4941, 4960, 4978, 4984, 5006, 5020, 5029, 5033, 5041, 5044, 5069, 5075, 5077, 5111, 5117, 5140, 5151, 5181, 5184, 5186, 5198, 5217, 5221, 5227, 5239, 5247, 5252, 5258, 5260, 5261, 5270, 5277, 5281, 5315, 5321, 5326, 5333, 5334, 5351, 5352, 5371, 5381, 5384, 5386, 5391, 5399, 5409, 5413, 5416, 5417, 5424, 5455, 5487, 5488, 5494, 5506, 5507, 5516, 5529, 5544, 5546, 5551, 5557, 5558, 5563, 5576, 5588, 5591, 5629, 5657, 5661, 5666, 5675, 5676, 5679, 5697, 5698, 5699, 5708, 5718, 5727, 5775, 5780, 5783, 5788, 5816, 5838, 5854, 5863, 5876, 5878, 5886, 5926, 5934, 5936, 5937, 5938, 5939, 5940, 5946, 5976, 5980, 5998, 6005, 6010, 6015, 6022, 6052, 6055, 6078, 6080, 6094, 6097, 6099, 6104, 6144, 6150, 6165, 6176, 6183, 6199, 6205, 6209, 6213, 6216, 6222, 6231, 6234, 6249, 6251, 6257, 6259, 6264, 6286, 6294, 6296, 6305, 6312, 6335, 6344, 6349, 6361, 6368, 6382, 6397, 6409, 6411, 6415, 6436, 6446, 6491, 6497, 6508, 6512, 6525, 6533, 6536, 6540, 6583, 6608, 6618, 6625, 6626, 6627, 6656, 6660, 6674, 6677, 6678, 6685, 6689, 6693, 6704, 6711, 6726, 6728, 6732, 6738, 6750, 6762, 6773, 6774, 6785, 6786, 6791, 6804, 6818, 6819, 6828, 6833, 6834, 6837, 6847, 6855, 6867, 6873, 6876, 6886, 6895, 6896, 6928, 6931, 6961, 6962, 6971, 6979, 6986, 7011, 7024, 7034, 7049, 7057, 7058, 7061, 7064, 7087, 7093, 7096, 7113, 7122, 7135, 7142, 7144, 7155, 7161, 7163, 7166, 7219, 7227, 7259, 7264, 7284, 7285, 7295, 7307, 7334, 7342, 7347, 7360, 7367, 7383, 7403, 7405, 7423, 7428, 7431, 7437, 7443, 7452, 7454, 7466, 7476, 7482, 7499, 7508, 7527, 7528, 7531, 7533, 7539, 7559, 7585, 7610, 7615, 7623, 7627, 7628, 7652, 7668, 7676, 7682, 7685, 7691, 7693, 7703, 7716, 7726, 7728, 7748, 7770, 7779, 7802, 7817, 7840, 7863, 7869, 7872, 7874, 7875, 7886, 7894, 7903, 7912, 7918, 7934, 7939, 7941, 7957, 7958, 7970, 7973, 7982, 8001, 8002, 8008, 8016, 8030, 8036, 8044, 8049, 8057, 8061, 8064, 8067, 8101, 8104, 8112, 8143, 8155, 8163, 8180, 8182, 8219, 8227, 8236, 8237, 8268, 8273, 8280, 8285, 8293, 8326, 8333, 8337, 8341, 8350, 8380, 8381, 8387, 8392, 8400, 8402, 8422, 8425, 8428, 8437, 8455, 8462, 8486, 8510, 8525, 8530, 8531, 8537, 8543, 8548, 8565, 8569, 8573, 8588, 8596, 8607, 8614, 8636, 8674, 8683, 8685, 8698, 8708, 8721, 8722, 8723, 8728, 8729, 8735, 8763, 8773, 8774, 8788, 8804, 8811, 8813, 8817, 8831, 8836, 8865, 8867, 8869, 8877, 8890, 8895, 8904, 8905, 8909, 8932, 8938, 8939, 8950, 8961, 8962, 8974, 8988, 8989, 8995, 9001, 9004, 9036, 9060, 9066, 9082, 9090, 9093, 9108, 9120, 9121, 9138, 9141, 9142, 9150, 9166, 9174, 9185, 9189, 9207, 9215, 9226, 9232, 9241, 9250, 9268, 9283, 9292, 9294, 9301, 9319, 9320, 9339, 9342, 9352, 9354, 9367, 9388, 9392, 9414, 9416, 9423, 9429, 9462, 9474, 9475, 9484, 9519, 9560, 9596, 9597, 9606, 9630, 9645, 9659, 9660, 9702, 9713, 9717, 9724, 9726, 9732, 9735, 9749, 9765, 9771, 9796, 9799, 9806, 9822, 9829, 9830, 9833, 9841, 9842, 9848, 9849, 9854, 9872, 9877, 9894, 9902, 9904, 9905, 9906, 9914, 9926, 9952, 9966, 9978, 9983, 9989, 9993, 10024, 10025, 10029, 10038, 10044, 10072, 10086, 10089, 10112, 10119, 10121, 10125, 10159, 10181, 10184, 10193, 10199, 10202, 10212, 10219, 10230, 10241, 10244, 10263, 10276, 10281) group by time_by_day.the_year, time_by_day.quarter, time_by_day.month_of_year, customer.customer_id;
