
CREATE DATABASE ESportsManagement;


USE ESportsManagement;


CREATE TABLE Team (
    MaDoi VARCHAR(10) PRIMARY KEY,
    TenDoi VARCHAR(100) NOT NULL,
    QuocGia VARCHAR(50),
    ChuSoHuu VARCHAR(100),
    NamThanhLap INT
);

CREATE TABLE Player (
    MaTuyenthu VARCHAR(10) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    BietDanh VARCHAR(50),
    ViTriThiDau VARCHAR(50),
    MucLuong DECIMAL(10,2),
    MaDoi VARCHAR(10),
    FOREIGN KEY (MaDoi) REFERENCES Team(MaDoi)
);

CREATE TABLE Matchh (
    MaTranDau VARCHAR(10) PRIMARY KEY,
    ThoiGianBatDau DATETIME,
    KetQua VARCHAR(20)
);


CREATE TABLE Match_Statistic (
    MaTranDau VARCHAR(10),
    MaTuyenthu VARCHAR(10),
    Kills INT,
    Deaths INT,
    Assists INT,
    PRIMARY KEY (MaTranDau, MaTuyenthu),
    FOREIGN KEY (MaTranDau) REFERENCES Matchh(MaTranDau),
    FOREIGN KEY (MaTuyenthu) REFERENCES Player(MaTuyenthu)
);																	

ALTER TABLE Matchh ADD COLUMN GiaiThuong DECIMAL(10,2);


ALTER TABLE Team CHANGE COLUMN QuocGia KhuVuc VARCHAR(50);


DROP TABLE Match_Statistic;
DROP TABLE Matchh;

INSERT INTO Team (MaDoi, TenDoi, KhuVuc, ChuSoHuu, NamThanhLap) VALUES
('T001', 'Team Alpha', 'Vietnam', 'Owner1', 2020),
('T002', 'Team Beta', 'Korea', 'Owner2', 2019),
('T003', 'Team Gamma', 'USA', NULL, 2021),
('T004', 'Team Delta', 'Vietnam', 'Owner4', 2018),
('T005', 'Team 5 Tuất', 'Japan', 'Owner5', 2022);

INSERT INTO Player (MaTuyenthu, HoTen, BietDanh, ViTriThiDau, MucLuong, MaDoi) VALUES
('P001', 'Do na trum', 'NickA', 'Jungler', 100.00, 'T001'),
('P002', 'Nguyễn Bu Tin', 'NickB', 'ADC', 120.00, 'T002'),
('P003', 'Ngôn Nhất Trì', 'NickC', 'Jungler', 80.00, 'T003'),
('P004', ' Antony ', 'NickD', 'Mid', 150.00, 'T004'),
('P005', 'Tonkuda', 'NickE', 'Top', 90.00, 'T005');

INSERT INTO Matchh (MaTranDau, ThoiGianBatDau, KetQua, GiaiThuong) VALUES
('M001', '2023-10-01 10:00:00', '2-1', 5000.00),
('M002', '2023-10-02 12:00:00', '1-0', 3000.00),
('M003', '2023-10-03 14:00:00', '3-2', 7000.00),
('M004', '2023-10-04 16:00:00', '0-1', 2000.00),
('MS_007', '2023-10-05 18:00:00', '2-2', 4000.00);

INSERT INTO Match_Statistic (MaTranDau, MaTuyenthu, Kills, Deaths, Assists) VALUES
('M001', 'P001', 5, 2, 10),
('M001', 'P002', 3, 1, 8),
('M002', 'P003', 4, 3, 7),
('MS_007', 'P004', 6, 0, 12),
('M004', 'P005', 2, 4, 5);
SET SQL_SAFE_UPDATES = 0;
UPDATE Player SET MucLuong = MucLuong * 1.20 WHERE ViTriThiDau = 'Jungler';

DELETE FROM Team WHERE ChuSoHuu IS NULL;

SELECT * FROM Player WHERE MucLuong BETWEEN 50 AND 150;
SELECT * FROM Matchh WHERE MaTranDau = 'MS_007';
SELECT P.BietDanh, P.ViTriThiDau FROM Player P JOIN Team T ON P.MaDoi = T.MaDoi WHERE T.KhuVuc = 'Vietnam';
