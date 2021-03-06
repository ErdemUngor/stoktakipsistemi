USE [DbMvcStok]
GO
/****** Object:  Table [dbo].[tblKategori]    Script Date: 23.12.2021 15:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKategori](
	[kategoriId] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAd] [varchar](50) NULL,
 CONSTRAINT [PK_tblKategori] PRIMARY KEY CLUSTERED 
(
	[kategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMusteri]    Script Date: 23.12.2021 15:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusteri](
	[musteriId] [int] IDENTITY(1,1) NOT NULL,
	[musteriAd] [varchar](30) NULL,
	[musteriSoyad] [varchar](30) NULL,
	[musteriSehir] [varchar](15) NULL,
	[musteriBakiye] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblMusteri] PRIMARY KEY CLUSTERED 
(
	[musteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersonel]    Script Date: 23.12.2021 15:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonel](
	[personelId] [int] IDENTITY(1,1) NOT NULL,
	[personelAd] [varchar](30) NULL,
	[personelSoyad] [varchar](30) NULL,
	[personelDepartman] [varchar](30) NULL,
 CONSTRAINT [PK_tblPersonel] PRIMARY KEY CLUSTERED 
(
	[personelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSatislar]    Script Date: 23.12.2021 15:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSatislar](
	[satisId] [int] IDENTITY(1,1) NOT NULL,
	[satisUrun] [int] NULL,
	[satisPersonel] [int] NULL,
	[satisMusteri] [int] NULL,
	[satisFiyat] [decimal](18, 2) NULL,
	[satisTarih] [smalldatetime] NULL,
 CONSTRAINT [PK_tblSatislar] PRIMARY KEY CLUSTERED 
(
	[satisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUrunler]    Script Date: 23.12.2021 15:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUrunler](
	[urunId] [int] IDENTITY(1,1) NOT NULL,
	[urunAd] [varchar](50) NULL,
	[urunMarka] [varchar](50) NULL,
	[urunStok] [smallint] NULL,
	[urunAlisFiyat] [decimal](18, 2) NULL,
	[urunSatisFiyat] [decimal](18, 2) NULL,
	[urunKategori] [int] NULL,
 CONSTRAINT [PK_tblUrunler] PRIMARY KEY CLUSTERED 
(
	[urunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSatislar] ADD  CONSTRAINT [DF_tblSatislar_satisTarih]  DEFAULT (getdate()) FOR [satisTarih]
GO
ALTER TABLE [dbo].[tblSatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblSatislar_tblMusteri] FOREIGN KEY([satisMusteri])
REFERENCES [dbo].[tblMusteri] ([musteriId])
GO
ALTER TABLE [dbo].[tblSatislar] CHECK CONSTRAINT [FK_tblSatislar_tblMusteri]
GO
ALTER TABLE [dbo].[tblSatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblSatislar_tblPersonel] FOREIGN KEY([satisPersonel])
REFERENCES [dbo].[tblPersonel] ([personelId])
GO
ALTER TABLE [dbo].[tblSatislar] CHECK CONSTRAINT [FK_tblSatislar_tblPersonel]
GO
ALTER TABLE [dbo].[tblSatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblSatislar_tblUrunler] FOREIGN KEY([satisUrun])
REFERENCES [dbo].[tblUrunler] ([urunId])
GO
ALTER TABLE [dbo].[tblSatislar] CHECK CONSTRAINT [FK_tblSatislar_tblUrunler]
GO
ALTER TABLE [dbo].[tblUrunler]  WITH CHECK ADD  CONSTRAINT [FK_tblUrunler_tblKategori] FOREIGN KEY([urunKategori])
REFERENCES [dbo].[tblKategori] ([kategoriId])
GO
ALTER TABLE [dbo].[tblUrunler] CHECK CONSTRAINT [FK_tblUrunler_tblKategori]
GO
