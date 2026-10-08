-- 1. Lưu kết quả Phân tích Chi phí Kho vào schema Core
CREATE VIEW core.vw_chi_phi_theo_kho AS
SELECT 
    d.Kho_Xuat,
    COUNT(d.Ma_Don) AS Tong_So_Don,
    SUM(c.Tong_Gia_Tri_Hang) AS Tong_Doanh_Thu,
    SUM(c.Phi_Van_Chuyen) AS Tong_Phi_Van_Chuyen,
    ROUND((SUM(c.Phi_Van_Chuyen) / SUM(c.Tong_Gia_Tri_Hang) * 100), 2) AS Ty_Le_Phi_Van_Chuyen_Phan_Tram
FROM staging.don_hang d
JOIN staging.chi_phi_thanh_toan c ON d.Ma_Don = c.Ma_Don
GROUP BY d.Kho_Xuat;

-- 2. Lưu kết quả Phân tích Lợi nhuận Sản phẩm vào schema Core
CREATE VIEW core.vw_loi_nhuan_san_pham AS
SELECT 
    p.Ten_Hang_Hoa AS Ten_San_Pham,
    COUNT(d.Ma_Don) AS Tong_So_Don,
    SUM(c.Tong_Gia_Tri_Hang) AS Tong_Doanh_Thu,
    SUM(c.Phi_Van_Chuyen) AS Tong_Phi_Ship,
    (SUM(c.Tong_Gia_Tri_Hang) - SUM(c.Phi_Van_Chuyen) - SUM(c.VAT_10)) AS Loi_Nhuan_Gop
FROM staging.don_hang d
JOIN staging.linh_kien_dien_tu_san_pham p ON d.Ma_San_Pham = p.Ma_San_Pham
JOIN staging.chi_phi_thanh_toan c ON d.Ma_Don = c.Ma_Don
GROUP BY p.Ten_Hang_Hoa;

-- 3. Lưu kết quả Chân dung Khách hàng
CREATE VIEW core.vw_chan_dung_khach_hang AS
SELECT 
    k.Tinh_Thanh,
    k.Gioi_Tinh,
    COUNT(DISTINCT k.Ma_Khach_Hang) AS So_Luong_Khach_Hang,
    COUNT(d.Ma_Don) AS Tong_So_Don,
    SUM(c.Tong_Thanh_Toan) AS Tong_Doanh_Thu
FROM staging.thong_tin_khach_hang k
JOIN staging.don_hang d ON k.Ma_Khach_Hang = d.Ma_Khach_Hang
JOIN staging.chi_phi_thanh_toan c ON d.Ma_Don = c.Ma_Don
GROUP BY k.Tinh_Thanh, k.Gioi_Tinh;

-- 4. Lưu kết quả Tỷ trọng Giao hàng
CREATE VIEW core.vw_ty_trong_giao_hang AS
SELECT 
    t.Loai_Giao_Hang,
    COUNT(t.Ma_Don) AS So_Luong_Don,
    ROUND(COUNT(t.Ma_Don) * 100.0 / (SELECT COUNT(*) FROM staging.thoi_gian_giao_hang), 2) AS Ty_Le_Phan_Tram
FROM staging.thoi_gian_giao_hang t
GROUP BY t.Loai_Giao_Hang;