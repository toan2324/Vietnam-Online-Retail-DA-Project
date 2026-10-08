# [JIRA TICKET: DA-2026] Phân tích Rò rỉ Dòng tiền & Tối ưu Chi phí Vận hành E-commerce
---
**Người giao việc (Reporter):** Giám đốc Vận hành (COO)
**Người tiếp nhận (Assignee):** Data Analyst
**Thời hạn bàn giao (Deadline):** Cuối tháng
**Bộ dữ liệu:** Vietnam Online Retail Transactions (Ngành hàng Linh kiện Điện tử)

### 1. Bối cảnh Kinh doanh (Business Context)
Quý vừa qua, công ty ghi nhận mức tăng trưởng doanh thu ấn tượng nhờ các chiến dịch đẩy mạnh bán ngành hàng linh kiện điện tử. Tuy nhiên, Kế toán trưởng báo cáo dòng tiền thực nhận (Net Revenue) đang bị hụt nghiêm trọng. Nguyên nhân ban đầu được COO nghi ngờ là do hiện tượng rò rỉ chi phí từ 3 mảng:
*   Tỷ lệ bom hàng/hoàn hàng tăng đột biến ở các đơn thanh toán tiền mặt (COD).
*   Chi phí vận chuyển và phí lưu kho bãi đang ăn mòn biên lợi nhuận, đặc biệt với các sản phẩm cồng kềnh.
*   Chất lượng giao hàng của các đối tác vận chuyển và kho bãi không đồng đều, dẫn đến trễ hạn và tăng tỷ lệ hủy đơn.

### 2. Mục tiêu Phân tích (Objectives)
Sử dụng dữ liệu lịch sử từ 6 bảng nghiệp vụ (Đơn hàng, Khách hàng, Sản phẩm, Thời gian, Chi phí, Vận chuyển) để lượng hóa chính xác các khoản thất thoát, tìm ra điểm gãy trong quy trình vận hành và đề xuất giải pháp xử lý.

### 3. Ba Câu hỏi Nghiệp vụ Cốt lõi (Core Business Questions)
*   **Câu hỏi 1 (Rủi ro Tài chính & Địa lý):** Tỷ lệ hoàn/hủy đơn (Return/Cancel Rate) và thiệt hại tài chính phân bổ như thế nào theo phương thức thanh toán (COD vs. Online) và khu vực địa lý của khách hàng? Đâu là "điểm nóng" cần cắt giảm trợ giá vận chuyển?
*   **Câu hỏi 2 (Hiệu suất Vận chuyển & Kho bãi):** Mối tương quan giữa thời gian giao hàng thực tế so với cam kết và hành vi hủy đơn của khách là gì? Phân tích chéo để tìm ra Đối tác vận chuyển / Kho xuất hàng nào đang có tỷ lệ trễ hạn cao nhất.
*   **Câu hỏi 3 (Biên lợi nhuận Sản phẩm):** Bóc tách doanh thu và chi phí, nhóm ngành hàng (Category) linh kiện nào đang sinh lời tốt nhất và nhóm nào đang bị âm lợi nhuận do gánh quá nhiều chi phí vận hành và hoàn trả?