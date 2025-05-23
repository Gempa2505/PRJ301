Use [master]
go
create database [PRJ301]
go
USE [PRJ301]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [int] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[shipping_id] [int]NULL,
	
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [int] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[Status] varchar(50) null,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'huy', N'1', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (2, N'Anjolie', N'SNZ6HE', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (3, N'Ferris', N'RXH3XJ', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (4, N'Katell', N'HWV8ZN', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (5, N'Zahir', N'NPX7OF', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (6, N'Conan', N'WIZ5VZ', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (7, N'Cade', N'ZSW2LU', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (8, N'Micah', N'RVV5SR', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (9, N'Rowan', N'VAI6XR', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (10, N'Kirby', N'DNX6JK', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (11, N'Tanisha', N'XWU7JP', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (12, N'Howard', N'TSR5MR', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (13, N'Tana', N'EHS8CM', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (14, N'Hadassah', N'YOY7ZW', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (15, N'Echo', N'IGE8TN', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (16, N'Slade', N'OFO6QS', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (17, N'Devin', N'IBM6RZ', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (18, N'Rowan', N'ZYS9VI', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (19, N'Rafael', N'WZA0IH', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (20, N'Madaline', N'QMW4EN', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (21, N'Vera', N'CZB2VM', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (22, N'Declan', N'ZKE7QZ', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (23, N'Katell', N'SFS0IW', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (24, N'Summer', N'PSQ7LC', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (25, N'Robin', N'KIS9AF', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (26, N'Dominique', N'IKV0IX', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (27, N'admin', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (28, N'mra', N'mra', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (29, N'mrb', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (30, N'Camden', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (31, N'manhdsz', N'123456', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (32, N'sfdfds', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (33, N'aaaaa', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (34, N'bbbb', N'1234', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (35, N'luong', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (38, N'mit', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (39, N'aaaaaaaa', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (40, N'bantq', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (41, N'thong', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (42, N'abcdd', N'1', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (43, N'quan', N'1', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (44, N'z', N'1', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (45, N'abc', N'1', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (46, N'anhtu', N'12', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Truyện Tranh')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Truyện Trinh Thám')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Hài Hước và Châm Biếm')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Cuộc Phiêu Lưu')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
--SET IDENTITY_INSERT [dbo].[OrderDetail] ON 


--INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (43, 16, N'Mật mã Davinci', N'https://th.bing.com/th/id/OIP.L5KVNop4MCLx5XQWFx5WkwHaHa?w=178&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 150, 1)
--INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (44, 17, N'Sherlock Holmes', N'https://th.bing.com/th/id/OIP.6vu-a3kimsxxHFI6-13i4wHaKX?w=133&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7', 140, 1)
--INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (45, 18, N'Akira', N'http://ts4.mm.bing.net/th?id=OIP.5YNMhxz-BcfJvobROAra8wHaJk&pid=15.1', 150, 2)
--INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (46, 19, N'One Piece', N'https://th.bing.com/th?id=OIP.t5RpTyYdPy_E0f0QEm6e-wHaJd&w=221&h=282&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', 140, 1)
--SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
--GO
--SET IDENTITY_INSERT [dbo].[Orders] ON 

--INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (14, 1, 1030, N'hàng dễ vỡ xin cẩn thận ', CAST(N'2022-03-15' AS Date), 14)
--INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (15, 41, 360, N'non', CAST(N'2022-03-17' AS Date), 15)
--INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (16, 1, 290, N'hàng dẽ vo', CAST(N'2022-07-03' AS Date), 16)
--INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (17, 1, 140, N'Hàng dễ vỡ', CAST(N'2022-07-07' AS Date), 17)
--INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (18, 44, 300, N'Hàng tốt', CAST(N'2022-11-06' AS Date), 18)
--INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id]) VALUES (19, 46, 140, N'ok', CAST(N'2023-04-23' AS Date), 20)
--SET IDENTITY_INSERT [dbo].[Orders] OFF
--GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (1, N'One Piece', N'https://th.bing.com/th?id=OIP.t5RpTyYdPy_E0f0QEm6e-wHaJd&w=221&h=282&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', 14000, N'Hành động, Phiêu lưu, Viễn tưởng, Hài', N'Đây là bộ manga xoay quanh chàng trai Monkey D. Luffy, chàng trai ngô nghê pha chút hài hước đến từ vùng biển East Blue. Luffy đã thành lập Băng hải tặc Mũ rơm cùng với những người bạn mà anh đã cứu giúp. Trên con tàu Going Merry, họ đã cùng nhau đi qua vô vàn thử thách để tìm kiếm One Piece - kho báu danh giá.

Với những thước truyện vừa gây cấn vừa đẹp đẽ về tình bạn, One Piece nhận được sự yêu mến của vô vàn người hâm mộ trên thế giới. Tác giả Oda Eiichiro cũng ghi tên mình vào Sách kỷ lục Guiness với thành tích bộ manga có số lượng in lớn nhất.

Tính đến thời điểm hiện tại, One Piece đã có đến hơn 1000 tập truyện, sức hút ngày càng được nhân rộng và nhận được nhiều sự yêu thích đến từ đọc giả trên toàn thế giới. One Piece là tác phẩm Manga kinh điển nhất được nhiều người biết đến nhất.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (2, N'Akira', N'http://ts4.mm.bing.net/th?id=OIP.5YNMhxz-BcfJvobROAra8wHaJk&pid=15.1', 15000, N'Hành động, Tình cảm, Viễn tưởng, Phiêu lưu', N'Akira là bộ manga có nội dung xoay quanh đề tài hậu tận thế. Năm 1992, cột mốc bắt đầu cho Thế chiến lần 3, một loại bom mới được chế tạo ra với sức công phá khủng khiếp đã thử nghiệm ngay trên thủ đô nước Nhật - Neo-Tokyo. Thành phố nhỏ vỡ vụn, hàng trăm ngàn người thiệt mạng và không biết bao nhiêu nhà cửa bị đổ nát, và hậu quả để lại là nhiều năm sau đó thành phố vẫn chưa khôi phục được. Tetsuo, nhân vật chính của bộ manga, khi tình cờ dạo quanh những đống đổ nát đã vô tình bị hút vào một cuộc thí nghiệm tâm linh bí ẩn do chính phủ thực hiện. Chính anh cũng không biết mình sắp đối diện với một thứ sức mạnh vô cùng đáng sợ, thứ đang là mục tiêu của những tổ chức khủng bố, thứ mang tên Akira,...', 1, 6)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (3, N'Sherlock Holmes', N'https://th.bing.com/th/id/OIP.6vu-a3kimsxxHFI6-13i4wHaKX?w=133&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7', 16000, N' Sherlock Holmes – Athur Conan Doyle ', N'SÁCH THEO CHỦ ĐỀ
Top 12 cuốn tiểu thuyết trinh thám hay nhất không nên bỏ qua
Trinh thám luôn là thể loại sách thu hút số lượng lớn độc giả bởi sự kịch tính và bất ngờ của nó. Khác hẳn với các thể loại khác, dòng văn trinh thám đòi hỏi khả năng tư duy rất cao từ tác giả, cũng như khối lượng kiến thức, thông tin khổng lồ được sử dụng để là chất liệu cho tác phẩm. Không phải bất cứ tác giả nào cũng đủ khả năng để nghĩ ra những vụ án giả tưởng song lại rất hợp lý. Ngày nay, dòng văn học trinh thám phát triển mạnh mẽ với số lượng tác phẩm khổng lồ. Tuy nhiên, nổi bật trong thế giới đầy phức tạp của văn học trinh thám, vẫn có những tác phẩm được xếp vào hàng kinh điển của thế giới và không thể thay thế trong lòng của các độc giả.

Review sách Bá Tước Monte Cristo - Alexandre Dumas
Những Cuốn Tiểu Thuyết Về Tuổi Thanh Xuân Hay Nhất
Review sách Tiếng Chim Hót Trong Bụi Mận Gai
Thiên thần nổi giận - Một tác phẩm nữ quyền
Những tác phẩm của Agatha Christie hay nhất mọi thời đại
Hãy cùng Sách Hay 24H điểm qua Top 12 cuốn tiểu thuyết trinh thám hay và nổi tiếng nhất trên toàn thế giới mà bạn không nên bỏ qua.

1, Sherlock Holmes – Athur Conan Doyle 
Sherlock Holmes được xem là một trong những huyền thoại trinh thám trên nền văn học thế giới. Hình tượng của vị thám tử tài ba là khuôn mẫu mà các nhà văn hướng tới khi xây dựng các tác phẩm trinh thám, nổi tiếng đến mức độ độc giả quyên mất đây chỉ là một nhân vật hư cấu.

Đây là cuốn tiểu thuyết vô cùng hấp dẫn với những câu chuyện đặc sắc, khiến người xem "nghẹt thở" đến giây phút cuối cùng. Cuốn sách xuất bản lần đầu tiên vào năm 1887, cho đến nay Sherlock Holmes Conan Doyle đã trở thành một tượng đài bất tử trong làng truyện trinh thám.', 2, 7)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (4, N'Mật mã Davinci', N'https://th.bing.com/th/id/OIP.L5KVNop4MCLx5XQWFx5WkwHaHa?w=178&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 17000, N'Mật mã Davinci – Dan Brown', N'Thêm một cuốn tiểu thuyết nổi tiếng của nhà văn Dan Brown được mệnh danh là một trong số cuốn tiểu thuyết trinh thám hay nhất mọi thời đại đó chính là Mật mã Davinci. Vào thời điểm tác phẩm này ra đời đã gây ra cuộc tranh cãi lớn trên văn đàn thế giới bởi việc sử dụng yếu tố thần học trong tác phẩm. Cuốn sách mang đậm phong cách cá nhân của Dan Brown khi có sự đan xen giữa yếu tố trinh thám và yếu tố thần thoại, hai chất liệu hoàn toàn trái ngược nhau.

Với những tình tiết hấp dẫn, hồi hộp hết sức nhưng không kém thú vị bạn sẽ khám phá được từ bất ngờ này đến bất ngờ khác trong câu chuyện. Tác phẩm kể nhân vật Langdon đang sống yên ổn, bỗng nhiên một ngày lại rơi vào một hoàn cảnh nguy hiểm đến tính mạng. Những may mắn ông đã gặp một người phụ nữ xinh đẹp nhưng không kém phần thông minh đó chính là Sophia. Sau một chuyến chạy trốn đầy nguy hiểm nhờ sự giúp đỡ của một nhà sử học tài ba có tên Teabing cả Langdon và Sophie đã khám phá được một bí mật động trời.', 2, 14)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (5, N'Agatha Christie', N'https://th.bing.com/th/id/OIP.Novn2_h-TqcCXd1rWOzGLgHaLa?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 12000, N'Án mạng trên chuyến tàu tốc hành Phương Đông - Agatha Christie', N'Được chắp bút bởi Agatha Christe – nữ hoàng truyện trinh thám, tác phẩm mang hơi hướng cổ điển song vẫn còn nguyên sức hút đối với độc giả qua thời gian.

Tác phẩm nói về vụ án mạng kỳ lạ xảy ra trên chuyến tàu tốc hành Phương Đông chạy từ Istambul về Calais mà thám tử Hercule Poirot tình cờ có mặt. Con tàu trở thành một căn phòng kín và hung thủ thì vẫn có mặt trên chuyến tàu trong suốt hành trình phá án. Nạn nhân trong tác phẩm là một kẻ thủ ác, đang bị đe dọa bởi những lá thư vì những tội ác hắn đã làm trong quá khứ, bị giết bởi 12 nhát dao. Nhưng điều kì là là các nhát dao này không phải của cùng 1 người, câu hỏi đặt ra là tại sao lại xuất hiện các vết thương khác nhau trên cùng một nạn nhân đã khiến cho vị thám tử vô cùng đau đầu.', 2, 6)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (6, N'Attack on Titan', N'https://th.bing.com/th/id/OIP.ksVp7D2vRNDKgQmZbJx4hAAAAA?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 13000, N'Hành động, Viễn tưởng, Kì ảo', N'Nếu muốn tìm một bộ manga với những tình tiết kỳ ảo siêu thực thì Attack on Titan sẽ là một sự lựa chọn khá đúng đắn. Truyện được xây dựng với sự tưởng tượng của tác giả về một thế giới giả tưởng, với cách kể đan xen giữa quá khứ và hiện tại khơi gợi sự tò mò nơi người đọc. Ở thế giới đó, người nắm quyền lực cao nhất là những người khổng lồ Titan. Con người lúc ấy bé nhỏ và yếu ớt vô cùng, họ phải làm những bức tường thành để ngăn chặn Titan. Nhưng rồi một ngày nọ, một Titan bất ngờ xuất hiện, phá nát tường thành và đem lại nỗi sợ hãi kinh hoàng cho loài người. Nhóm ba người bạn trẻ Eren, Armin và Mikasa quyết tâm lên đường mặc bao nguy hiểm để tìm ra chân tướng sự việc…', 1, 7)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (7, N'Bleach', N'https://th.bing.com/th/id/OIP.pqkGhkmI5x5ck75lwDD76QHaLH?w=144&h=216&c=7&r=0&o=5&dpr=1.3&pid=1.7', 100000, N'Viễn tưởng, Hài hước, Tình cảm', N'Cái thiện và cái ác là những đề tài phổ biến trong các tác phẩm truyện tranh, nhưng để diễn tả ranh giới và những bài học xung quanh hai thái cực đối lập này thì Bleach chính là một kiệt tác. Nhân vật chính trong bộ truyện này là Kurosachi Ichigo. Một cách vô cùng tình cờ tựa như sự sắp đặt của số phận, Ichigo bỗng nhiên biến thành thần chết. Và ở cương vị mới này, anh đã giúp bạn bè và những người thân yêu của mình vượt qua muôn vàn thử thách hiểm nguy. Và họ cũng chính là những người luôn sát cánh bên anh, cùng anh vượt qua gian khó.

Thời gian đầu ra mắt, Bleach đã tạo nên cơn sốt khủng khiếp trên khắp châu Á với hàng triệu bản được bán ra và được dựng thành phim. Đến tận bây giờ, Bleach vẫn sống mãi trong lòng người đọc như một tượng đài manga vô cùng vĩ đại.', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (8, N'Detective Conan', N'https://th.bing.com/th/id/OIP.slmunl7V2zjL85QQlXKs8gHaLZ?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 18000, N'Trinh thám, Hài hước, Tình cảm', N'Nhắc đến Manga mà bỏ quên Thám tử lừng danh Conan thì quả là một thiếu sót to lớn. Đây là tập truyện manga lấy bối cảnh Nhật Bản hiện đại với nhân vật chính là Shinichi Kudo - thám tử lừng danh trung học. Trong một lần phá án, cậu bị bọn Tổ chức áo đen phát giác và cho uống thuốc teo nhỏ. Từ đó, Shinichi xuất hiện dưới hình dạng chú bé Edogawa Conan 6 tuổi nhưng trí não và khả năng phá án thiên tài vẫn không thay đổi. Tá túc tại nhà cô bạn gái Ran Mori, Conan đã tham gia phá rất nhiều vụ án bí ẩn và dần dần vạch trần chân tướng Tổ chức áo đen….

Thành công của Detective Conan là một dấu son chói lọi trong lịch sử Manga nước Nhật. Câu chuyện chàng thám tử tí hon suốt bao nhiêu năm rồi vẫn khiến bao thế hệ khán giả yêu mến không ngừng.', 1, 14)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (9, N'Kanae Minato', N'https://th.bing.com/th/id/R.3173231ab9ce879abca2186631c6de17?rik=necXdEydlU8Hag&riu=http%3a%2f%2fwww.netabooks.vn%2fData%2fSites%2f1%2fProduct%2f49476%2fthieu-nu-minato-kanae.jpg&ehk=l5KCx2cSpeNBeBT%2bj%2b8L%2fmbpQ91WFnttltruYBJygpQ%3d&risl=&pid=ImgRaw&r=0', 10000, N'Thú tội – Kanae Minato', N'Đây là một trong những cuốn sách mà câu chuyện của nó khiến  người đọc phải ớn lạnh bởi sự tàn ác của hung thủ và của chính nạn nhân, từ động cơ gây án cũng như cách thức giết người của hung thủ và cả sự trả thù đến từ nạn nhân.

Tác phẩm kể về diễn biến tâm lý của những nhân vật, cụ thể là những đứa trẻ mới lớn bị giáo dục một cách lầm lạc. Như cái tên của cuốn sách, 6 chương vẻn vẹn hơn 200 trang sách chỉ nói về thú tội. Lần lượt là tường thuật của cô giáo, lớp trưởng, bà mẹ học sinh B, rồi đến lời tự sự điên loạn của B, di chúc của A & cuối cùng khép lại bằng cuộc gọi của cô giáo cho học sinh A. Tất cả mọi lời thú tội đều bắt đầu xung quanh câu chuyện về Manami, con gái của cô giáo, bị giết hại bởi chính những học sinh của mình.', 2, 6)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (10, N'Những Người Thích Đùa', N'https://th.bing.com/th/id/OIP.H7DDKgiNygqfa1bRGNaBMQHaKX?w=142&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7', 10000, N'Những Người Thích Đùa – tác giả: Azit Nexin', N'Cái tên Azit Nexin có lẽ đã quá quen thuộc với bạn đọc trên khắp thế giới, với những cuốn sách đậm chất trào phúng, châm biếm. Những Người Thích Đùa là một trong những tác phẩm nổi tiếng nhất của Azit Nexin.

Những Người Thích Đùa mang đậm ý nghĩa thời đại, dù được viết cách đây nhiều năm nhưng vẫn lưu giữ nhiều giá trị cho đến ngày nay. Những chi tiết gây cười trong sách được xây dựng nhẹ nhàng, dễ tiếp nhận, giúp người đọc như đang tự soi mình vào gương, nhìn ra những điều rất đỗi ngớ ngẩn, hài hước mà chúng ta vẫn vô thức chấp nhận và làm theo mỗi ngày.', 3, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (11, N'Ông Trăm Tuổi Trèo Qua Cửa Sổ Và Biến Mất', N'https://th.bing.com/th/id/OIP.setIlltlzaiKpPDkpU8lcAHaHa?w=216&h=216&c=7&r=0&o=5&dpr=1.3&pid=1.7', 12000, N'Ông Trăm Tuổi Trèo Qua Cửa Sổ Và Biến Mất – tác giả: Jonas Jonasson
', N'Câu chuyện kể về chuyến phiêu lưu của ông cụ Allan Karlson, vào ngày sinh nhật thứ 100 của mình, đã trèo qua cửa sổ viện dưỡng lão và lập tức mất tăm. Một cuộc truy tìm quy mô lớn đã diễn ra trên khắp đất nước Thụy Điển, từ phía những người ở viện dưỡng lão, chính quyền sở tại cũng như một trên trộm ngớ ngẩn trao nhầm vali tiền cho ông cụ.

Cuộc truy bắt có vẻ sẽ rất dễ dàng, bởi một cụ già thì đi xa được bao nhiêu cơ chứ? Nhưng cụ già sống tròn 1 thế kỷ này đâu phải là người đơn giản như vậy.', 3, 7)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (12, N'Những Cuộc Phiêu Lưu Của Huckleberry Finn', N'https://th.bing.com/th/id/OIP.dLsDLErwCXbTDXHnTwJGYwHaLe?w=136&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7', 12000, N'Những Cuộc Phiêu Lưu Của Huckleberry Finn – Mark Twain', N'Câu chuyện kể về những cuộc phiêu lưu của Huckleberry Finn trên dòng sông Mississippi với người bạn là Jim, một nô lệ đang chạy thoát. 

Quyển sách phiêu lưu này miêu tả những cảnh vật trên dòng sông và châm biếm những quan điểm ở miền Nam Hoa Kỳ thời tiền chiến, đặc biệt là quan điểm kỳ thị chủng tộc. 

Hình ảnh Huck và Jim trên chiếc bè chạy theo dòng sông, đi đến tự do, là một trong những hình ảnh bất hủ nhất trong văn học Hoa Kỳ.', 4, 7)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (13, N'Ông Nội Vượt Ngục ', N'https://th.bing.com/th/id/OIP.3woOA2X9XMbceAMfqqowHwAAAA?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 16000, N'Ông Nội Vượt Ngục – tác giả: David Walliams', N'Tiếp tục là câu chuyện về chuyến phiêu lưu của ông cụ già, nhưng trong Ông Nội Vượt Ngục, ông cụ lại có bạn đồng hành là cậu cháu trai nhút nhát, rụt rè. Xuyên suốt chuyến hành trình “ảo” không kém Ông Trăm Tuổi Trèo Qua Cửa Sổ Và Biến Mất, cuốn truyện Ông Nội Vượt Ngục được lồng ghép những bài học về lối sống trung thực, tình yêu dành cho gia đình và nhiều điều ý nghĩa khác.', 3, 19)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (14, N'Số Đỏ', N'https://th.bing.com/th/id/OIP.vYBIkKKcvngIucvQCiwmAAAAAA?w=132&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7', 15000, N'Số Đỏ – tác giả: Vũ Trọng Phụng', N'Vũ Trọng Phụng là “ông vua” của thể loại văn hiện thực trào phúng thời kỳ trước Cách mạng Tháng Tám. Tác phẩm của ông có giọng văn châm biếm, hài hước một cách sâu cay, phản ánh những hiện thực của xã hội đầy nhiễu nhương thời đó.

Nội dung cuốn sách trào phúng Số Đỏ là câu chuyện về Xuân Tóc Đỏ, một thằng Ma-cà-bông đầu đường xó chợ bỗng chốc có cơ hội đổi đời, trở thành “đốc tờ Xuân” được mọi người kính trọng và cưới được cô tiểu thư con nhà quyền quý.', 3, 15)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (15, N'Những Cuộc Phiêu Lưu Của Tom Sawyer', N'https://th.bing.com/th/id/OIP.PVvL-dA3ktzSXXAQK0QUDAHaKX?w=144&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7', 18000, N'Những Cuộc Phiêu Lưu Của Tom Sawyer – Mark Twain', N'Ra đời năm 1876, hơn 100 năm nay, cuốn tiểu thuyết phiêu lưu này đã được người đọc ở nhiều lứa tuổi, nhiều dân tộc khác nhau yêu mến. 

Tác giả không chỉ thuật lại câu chuyện có hậu về chú Tom tinh nghịch, mà còn dựng nên một bức tranh hiện thực về cuộc sống của các nhân vật bé nhỏ trong truyện, đặc biệt đi sâu vào thế giới bên trong con người, miêu tả giản dị và chính xác tâm lý trẻ em. Tác phẩm chứa đựng trong nó một chất thơ trong trẻo, được coi là một “khúc ca về tuổi thơ”.', 4, 18)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (16, N'Cuộc Sống Rất Giống Cuộc Đời ', N'https://th.bing.com/th/id/OIP.hMLXTdK7nk7uZCOF7TuybAHaHa?w=187&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7', 15000, N'Cuộc Sống Rất Giống Cuộc Đời – tác giả: Nguyễn Hoàng Hải', N'Nguyễn Hoàng Hải là gương mặt quen thuộc đối với các bạn trẻ khi là nhân vật chính trong các buổi talkshow của nhóm hài Trắng TV, cùng với Tuấn Tiền Tỷ. Cuộc Sống Rất Giống Cuộc Đời là cuốn sách đầu tay của anh.

Đây là tập hợp các bài tản văn xoay quanh những câu chuyện thường nhật của tác giả như gia đình, bạn bè, đồng nghiệp…, những câu chuyện có vẻ nhỏ nhặt những vô tình gây ra tương đối nhiều áp lực cho mỗi người.

Bằng giọng văn hài hước, tác giả dẫn dắt cái nhìn của người đọc để có thể cảm nhận cuộc sống một cách khác đi, thoáng hơn, nhẹ nhàng hơn.', 3, 17)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (17, N'Đảo Giấu Vàng', N'https://th.bing.com/th/id/OIP.u4QLcoxvFGN3dD-O4ETbuwHaKX?w=137&h=192&c=7&r=0&o=5&dpr=1.3&pid=1.7', 18000, N'Đảo Giấu Vàng – Robert Louis Stevenson', N'Đảo giấu vàng – cái tên nghe hấp dẫn như chuyện cổ tích ấy lại là một câu chuyện về xã hội Anh hồi thế kỷ thứ XVIII, cái thế kỉ tanh “máu và bùn” của vương triều London đang mở rộng cuộc hành trình chinh phạt và xâm chiếm thuộc địa để biến nước Anh thành một đế quốc “không có mặt trời lặn”. 

Một chế độ kẻ cướp ắt sinh ra những tên cướp. Ấy là nguồn gốc mọc lên “Đảo giấu vàng” trong xứ sở những hòn đảo Britain kia.', 4, 15)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (18, N'Những Cuộc Phiêu Lưu Của Pinocchio', N'https://th.bing.com/th/id/OIP.5Vx9bXp0cq4s5nfp6rRndwHaHa?w=214&h=214&c=7&r=0&o=5&dpr=1.3&pid=1.7', 20000, N'Những Cuộc Phiêu Lưu Của Pinocchio – Nhiều Tác Giả', N'Hơn 100 năm qua, kể từ khi ra đời, câu chuyện Những cuộc phiêu lưu của Pinocchio của Carlo Collodi đã làm say mê bao thế hệ trẻ em khắp thế giới. 

Từ nguyên bản tác phẩm, biết bao cuốn sách, bao thước phim về cậu bé Pinocchio đã ra đời ở nhiều quốc gia. 

Lần này, Pinocchio đến với độc giả nhỏ tuổi Việt Nam với những điều vô cùng đặc biệt và thú vị thông qua hình thức truyện tranh.

Cuốn sách được minh họa bởi chính một họa sĩ người Ý, quê hương của Pinocchio – họa sĩ Tony Wolf – người đã trở nên rất đỗi quen thuộc với độc giả Việt Nam qua bộ Chuyện rừng nay sẽ tiếp tục mang đến cho các em những hình ảnh vô cùng sinh động, ngộ nghĩnh về chú bé gỗ Pinocchio.', 4, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
--SET IDENTITY_INSERT [dbo].[Shipping] ON 

--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (14, N'khanh manh', N'0375801453', N'lâm thao-phú tho','Delivered')
--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (15, N'thong ml', N'12345678', N'khoái châu-hưng yên','Delivered')
--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (16, N'khanh manh', N'0375801453', N'lâm thao-phú tho','Delivered')
--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (17, N'khanh manh', N'12345678', N'lâm thao-phú tho','Delivered')
--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (18, N'ly', N'0375801453', N'lâm thao-phú tho','Delivered')
--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (19, N'khanh manh', N'12345678', N'lâm thao-phú tho','Delivered')
--INSERT [dbo].[Shipping] ([id], [name], [phone], [address],[Status]) VALUES (20, N'tu', N'112waa', N'sđrrê','Delivered')
--SET IDENTITY_INSERT [dbo].[Shipping] OFF
--GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_product_Category]
GO
