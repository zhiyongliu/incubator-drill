select time_by_day.the_year as c0, time_by_day.quarter as c1, time_by_day.month_of_year as c2, customer.customer_id as c3, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter in ('Q1', 'Q4') and time_by_day.month_of_year in (2, 3, 10) and sales_fact_1997.customer_id = customer.customer_id and customer.customer_id in (5, 14, 19, 46, 51, 58, 69, 85, 91, 105, 106, 111, 124, 137, 163, 167, 170, 193, 197, 200, 212, 215, 246, 257, 269, 273, 283, 289, 296, 311, 313, 323, 331, 332, 333, 350, 356, 366, 383, 396, 421, 436, 469, 507, 509, 517, 526, 527, 547, 589, 598, 600, 613, 623, 631, 652, 653, 659, 660, 661, 666, 668, 669, 679, 689, 690, 699, 700, 702, 707, 716, 720, 723, 729, 734, 744, 748, 792, 803, 829, 839, 841, 845, 851, 859, 860, 861, 881, 882, 884, 887, 888, 894, 900, 912, 917, 922, 939, 981, 999, 1006, 1018, 1021, 1023, 1031, 1054, 1060, 1069, 1075, 1087, 1102, 1108, 1111, 1112, 1138, 1151, 1191, 1215, 1220, 1226, 1237, 1242, 1247, 1255, 1272, 1276, 1331, 1354, 1357, 1369, 1373, 1386, 1389, 1391, 1398, 1407, 1434, 1439, 1446, 1463, 1464, 1469, 1509, 1512, 1521, 1522, 1527, 1532, 1534, 1549, 1559, 1570, 1576, 1592, 1595, 1603, 1605, 1609, 1643, 1644, 1654, 1661, 1664, 1665, 1668, 1679, 1680, 1698, 1724, 1728, 1743, 1752, 1761, 1762, 1774, 1780, 1795, 1804, 1822, 1824, 1828, 1837, 1849, 1872, 1879, 1885, 1895, 1898, 1907, 1928, 1935, 1962, 1967, 1985, 1990, 1992, 1997, 2045, 2046, 2074, 2088, 2089, 2091, 2111, 2116, 2122, 2128, 2131, 2140, 2141, 2145, 2146, 2182, 2192, 2193, 2196, 2200, 2206, 2208, 2249, 2271, 2274, 2277, 2283, 2297, 2308, 2311, 2331, 2332, 2362, 2367, 2377, 2384, 2385, 2386, 2393, 2405, 2407, 2413, 2417, 2438, 2452, 2453, 2456, 2465, 2483, 2502, 2514, 2529, 2530, 2538, 2544, 2558, 2565, 2584, 2586, 2592, 2601, 2605, 2618, 2623, 2647, 2659, 2661, 2694, 2699, 2717, 2720, 2724, 2734, 2744, 2746, 2748, 2758, 2760, 2775, 2778, 2783, 2795, 2811, 2820, 2860, 2861, 2877, 2881, 2882, 2912, 2913, 2943, 2955, 2971, 2975, 2976, 2977, 3006, 3039, 3054, 3059, 3072, 3093, 3095, 3097, 3114, 3128, 3133, 3142, 3154, 3159, 3175, 3176, 3183, 3224, 3241, 3272, 3274, 3276, 3282, 3289, 3297, 3299, 3323, 3347, 3357, 3367, 3389, 3417, 3434, 3449, 3464, 3506, 3509, 3515, 3522, 3527, 3534, 3551, 3563, 3582, 3603, 3612, 3636, 3640, 3666, 3668, 3669, 3680, 3687, 3694, 3745, 3763, 3769, 3782, 3800, 3802, 3804, 3809, 3810, 3817, 3837, 3839, 3845, 3862, 3865, 3895, 3899, 3918, 3920, 3924, 3946, 3962, 3975, 3981, 3996, 4008, 4059, 4077, 4081, 4082, 4084, 4087, 4088, 4114, 4115, 4141, 4142, 4151, 4155, 4156, 4171, 4173, 4180, 4182, 4188, 4194, 4200, 4218, 4233, 4246, 4248, 4258, 4267, 4288, 4292, 4307, 4333, 4345, 4348, 4353, 4354, 4357, 4359, 4387, 4400, 4407, 4427, 4438, 4448, 4450, 4451, 4452, 4463, 4469, 4474, 4517, 4520, 4529, 4530, 4539, 4542, 4548, 4560, 4569, 4573, 4587, 4588, 4590, 4599, 4612, 4638, 4639, 4674, 4687, 4694, 4716, 4721, 4723, 4725, 4743, 4758, 4760, 4763, 4770, 4777, 4812, 4825, 4840, 4844, 4869, 4879, 4884, 4909, 4918, 4922, 4945, 4952, 4963, 4980, 4982, 4990, 5005, 5014, 5016, 5037, 5039, 5046, 5054, 5082, 5097, 5126, 5128, 5133, 5137, 5138, 5139, 5141, 5157, 5171, 5175, 5179, 5190, 5197, 5201, 5205, 5208, 5209, 5214, 5222, 5233, 5251, 5255, 5263, 5279, 5285, 5291, 5293, 5299, 5301, 5314, 5327, 5331, 5338, 5361, 5362, 5364, 5367, 5368, 5380, 5387, 5393, 5394, 5407, 5408, 5415, 5421, 5431, 5443, 5471, 5479, 5480, 5493, 5498, 5503, 5510, 5513, 5518, 5575, 5580, 5587, 5596, 5603, 5623, 5631, 5646, 5655, 5663, 5670, 5673, 5680, 5719, 5728, 5729, 5732, 5749, 5769, 5771, 5772, 5795, 5796, 5797, 5839, 5841, 5843, 5856, 5870, 5879, 5880, 5883, 5889, 5890, 5897, 5908, 5913, 5928, 5930, 5932, 5942, 5945, 5949, 5960, 5974, 5988, 6016, 6025, 6043, 6044, 6063, 6083, 6088, 6090, 6092, 6102, 6125, 6129, 6160, 6167, 6173, 6174, 6185, 6189, 6192, 6202, 6207, 6219, 6226, 6238, 6244, 6254, 6261, 6267, 6278, 6279, 6303, 6304, 6325, 6338, 6341, 6343, 6355, 6374, 6375, 6379, 6389, 6392, 6404, 6410, 6421, 6425, 6426, 6431, 6437, 6438, 6441, 6455, 6456, 6460, 6470, 6485, 6501, 6503, 6513, 6528, 6535, 6537, 6538, 6549, 6561, 6584, 6610, 6619, 6630, 6633, 6635, 6670, 6671, 6688, 6694, 6696, 6701, 6702, 6716, 6719, 6731, 6747, 6755, 6778, 6790, 6796, 6801, 6803, 6813, 6815, 6826, 6831, 6848, 6849, 6879, 6891, 6907, 6913, 6916, 6917, 6927, 6975, 6990, 7017, 7018, 7019, 7029, 7033, 7035, 7044, 7047, 7048, 7076, 7077, 7089, 7090, 7095, 7111, 7126, 7127, 7154, 7156, 7165, 7193, 7195, 7208, 7210, 7212, 7224, 7247, 7253, 7267, 7287, 7302, 7303, 7323, 7326, 7335, 7343, 7346, 7353, 7372, 7387, 7388, 7404, 7421, 7427, 7449, 7461, 7467, 7474, 7489, 7490, 7492, 7495, 7507, 7536, 7538, 7541, 7549, 7560, 7567, 7590, 7599, 7616, 7637, 7643, 7651, 7661, 7664, 7667, 7679, 7690, 7692, 7699, 7705, 7708, 7719, 7731, 7755, 7803, 7814, 7821, 7825, 7826, 7854, 7859, 7867, 7892, 7899, 7900, 7924, 7925, 7926, 7935, 7938, 7962, 7975, 7985, 7986, 8011, 8013, 8014, 8019, 8028, 8032, 8041, 8042, 8047, 8085, 8086, 8103, 8119, 8124, 8125, 8131, 8133, 8144, 8150, 8156, 8168, 8186, 8192, 8194, 8195, 8201, 8213, 8260, 8267, 8270, 8271, 8272, 8286, 8313, 8317, 8330, 8335, 8344, 8354, 8361, 8366, 8368, 8378, 8389, 8395, 8420, 8424, 8453, 8465, 8471, 8507, 8532, 8547, 8554, 8559, 8566, 8580, 8583, 8584, 8598, 8623, 8628, 8631, 8635, 8637, 8638, 8652, 8654, 8660, 8661, 8684, 8689, 8696, 8707, 8714, 8726, 8734, 8758, 8784, 8798, 8810, 8812, 8826, 8829, 8830, 8839, 8845, 8874, 8884, 8896, 8923, 8934, 8942, 8944, 8948, 8972, 9007, 9012, 9019, 9020, 9035, 9044, 9045, 9046, 9055, 9058, 9083, 9084, 9096, 9101, 9105, 9106, 9135, 9148, 9152, 9156, 9172, 9179, 9188, 9190, 9204, 9219, 9239, 9259, 9261, 9267, 9269, 9281, 9282, 9295, 9299, 9306, 9333, 9338, 9355, 9361, 9362, 9375, 9380, 9381, 9387, 9389, 9390, 9399, 9404, 9411, 9424, 9431, 9454, 9466, 9471, 9477, 9478, 9481, 9486, 9494, 9496, 9515, 9540, 9541, 9558, 9614, 9621, 9624, 9627, 9641, 9652, 9675, 9676, 9686, 9694, 9700, 9704, 9710, 9712, 9757, 9772, 9789, 9809, 9846, 9857, 9858, 9886, 9888, 9911, 9917, 9946, 9949, 9959, 9961, 9969, 9970, 9973, 9994, 10003, 10006, 10009, 10011, 10022, 10036, 10040, 10064, 10065, 10127, 10133, 10136, 10143, 10146, 10155, 10165, 10170, 10197, 10203, 10214, 10222, 10224, 10228, 10268, 10279) group by time_by_day.the_year, time_by_day.quarter, time_by_day.month_of_year, customer.customer_id;
