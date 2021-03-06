USE [master]
GO
/****** Object:  Database [rogerinho]    Script Date: 15/03/2018 14:59:56 ******/
CREATE DATABASE [rogerinho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rogerinho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\rogerinho.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rogerinho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\rogerinho_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [rogerinho] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rogerinho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rogerinho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rogerinho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rogerinho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rogerinho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rogerinho] SET ARITHABORT OFF 
GO
ALTER DATABASE [rogerinho] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rogerinho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rogerinho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rogerinho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rogerinho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rogerinho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rogerinho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rogerinho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rogerinho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rogerinho] SET  ENABLE_BROKER 
GO
ALTER DATABASE [rogerinho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rogerinho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rogerinho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rogerinho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rogerinho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rogerinho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rogerinho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rogerinho] SET RECOVERY FULL 
GO
ALTER DATABASE [rogerinho] SET  MULTI_USER 
GO
ALTER DATABASE [rogerinho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rogerinho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rogerinho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rogerinho] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rogerinho] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'rogerinho', N'ON'
GO
ALTER DATABASE [rogerinho] SET QUERY_STORE = OFF
GO
USE [rogerinho]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [rogerinho]
GO
/****** Object:  Schema [Classes]    Script Date: 15/03/2018 14:59:56 ******/
CREATE SCHEMA [Classes]
GO
/****** Object:  Schema [Contents]    Script Date: 15/03/2018 14:59:56 ******/
CREATE SCHEMA [Contents]
GO
/****** Object:  Schema [Courses]    Script Date: 15/03/2018 14:59:56 ******/
CREATE SCHEMA [Courses]
GO
/****** Object:  Schema [Persons]    Script Date: 15/03/2018 14:59:56 ******/
CREATE SCHEMA [Persons]
GO
/****** Object:  Table [Courses].[Courses]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Courses].[Courses](
	[id_course] [int] NOT NULL,
	[names] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[nomecurso_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[nomecurso_view] as
select names as 'Nome dos Cursos' 
from Courses.Courses
GO
/****** Object:  Table [Persons].[Users]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Persons].[Users](
	[id_user] [int] NOT NULL,
	[names] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
	[id_user_type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Courses].[Tutors]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Courses].[Tutors](
	[id_course_tutor] [int] NOT NULL,
	[id_course] [int] NOT NULL,
	[id_user] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_tutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[tutorcurso_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tutorcurso_view] as
select c.names as 'Nome do Curso', p.names as 'Tutor' 
from Courses.Tutors t, Courses.Courses c, Persons.Users p 
where t.id_course = c.id_course and t.id_user = p.id_user
GO
/****** Object:  Table [Classes].[courses_classes]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[courses_classes](
	[id_course_class] [int] NOT NULL,
	[names] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
	[id_course] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[classesdocurso_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[classesdocurso_view] as
select curso.names as 'Curso', classe.names as 'Classe' 
from Classes.courses_classes classe, Courses.Courses curso 
where classe.id_course = curso.id_course
GO
/****** Object:  Table [Classes].[courses_classes_tutors]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[courses_classes_tutors](
	[id_course_classes_tutors] [int] NOT NULL,
	[id_course_class] [int] NOT NULL,
	[id_course_tutor] [int] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_classes_tutors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[tutorclasse_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tutorclasse_view] as
select p.names as 'Tutor', c.names as 'Classes'
from Classes.courses_classes_tutors tuts, Courses.Tutors tut, Persons.Users p, Classes.courses_classes c
where tuts.id_course_tutor = tut.id_course_tutor and tut.id_user = p.id_user and tuts.id_course_class = c.id_course_class
GO
/****** Object:  Table [Classes].[courses_classes_students]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[courses_classes_students](
	[id_course_class_student] [int] NOT NULL,
	[id_course_class] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[removed] [int] NOT NULL,
	[student_score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_course_class_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[alunosclasse_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[alunosclasse_view] as
select p.names as 'Aluno', c.names as 'Classes' 
from Classes.courses_classes c, Classes.courses_classes_students s, Persons.Users P
where c.id_course_class = s.id_course_class and s.id_user = p.id_user
GO
/****** Object:  View [dbo].[scorealuno_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[scorealuno_view] as
select p.names as 'Aluno', s.student_score as 'Score'
from Classes.courses_classes_students s, Persons.Users p
where s.id_user = p.id_user
GO
/****** Object:  Table [Contents].[courses_classes_activities_students]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[courses_classes_activities_students](
	[id_activity_classes_students] [int] NOT NULL,
	[id_activity] [int] NOT NULL,
	[id_course_class_student] [int] NOT NULL,
	[removed] [int] NOT NULL,
	[delivery_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_activity_classes_students] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[numatividades_view]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[numatividades_view] as
select p.names as 'Aluno', count(ativs.delivery_date) as 'qtd'
from Contents.courses_classes_activities_students ativs, Classes.courses_classes_students students, Persons.Users p
where ativs.id_course_class_student = students.id_course_class_student and students.id_user = p.id_user
group by p.names
GO
/****** Object:  Table [Classes].[courses_classes_contents]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[courses_classes_contents](
	[id_courses_classes_contents] [int] NOT NULL,
	[removed] [int] NOT NULL,
	[Descriptiona] [nvarchar](max) NOT NULL,
	[id_course_class] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_courses_classes_contents] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Classes].[courses_classes_schedule]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Classes].[courses_classes_schedule](
	[id_schedule] [int] NOT NULL,
	[id_course_class] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[date_finished] [datetime] NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contents].[assessements_students]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[assessements_students](
	[id_assessement_student] [int] NOT NULL,
	[id_course_class_student] [int] NOT NULL,
	[id_assessment] [int] NOT NULL,
	[note] [decimal](5, 1) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assessement_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contents].[courses_classes_activities]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[courses_classes_activities](
	[id_activity] [int] NOT NULL,
	[id_course_class] [int] NOT NULL,
	[removed] [int] NOT NULL,
	[Descriptiona] [nvarchar](max) NOT NULL,
	[scheduled_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Contents].[courses_classes_assessements]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contents].[courses_classes_assessements](
	[id_assessment] [int] NOT NULL,
	[id_course_class] [int] NOT NULL,
	[removed] [int] NOT NULL,
	[scheduled_date] [datetime] NOT NULL,
	[realization_date] [datetime] NULL,
	[descriptiona] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assessment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Persons].[users_login]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Persons].[users_login](
	[id_user_login] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Persons].[users_types]    Script Date: 15/03/2018 14:59:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Persons].[users_types](
	[id_user_type] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[removed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (1, N'ES11', 0, 1)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (2, N'EC11', 0, 2)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (3, N'ADS11', 0, 3)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (4, N'ECA11', 0, 4)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (5, N'EM11', 0, 5)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (6, N'EL11', 0, 6)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (7, N'ELT11', 0, 7)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (8, N'M11', 0, 8)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (9, N'ES22', 0, 1)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (10, N'EC22', 0, 2)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (11, N'ADS22', 0, 3)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (12, N'ECA22', 0, 4)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (13, N'EM22', 0, 5)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (14, N'EL22', 0, 6)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (15, N'ELT22', 0, 7)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (16, N'M22', 0, 8)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (17, N'ES33', 0, 1)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (18, N'EC33', 0, 2)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (19, N'ADS33', 0, 3)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (20, N'ECA33', 0, 4)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (21, N'EM33', 0, 5)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (22, N'EL33', 0, 6)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (23, N'ELT33', 0, 7)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (24, N'M33', 0, 8)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (25, N'ES44', 0, 1)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (26, N'EC44', 0, 2)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (27, N'ADS44', 0, 3)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (28, N'ECA44', 0, 4)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (29, N'EM44', 0, 5)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (30, N'EL44', 0, 6)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (31, N'ELT44', 0, 7)
INSERT [Classes].[courses_classes] ([id_course_class], [names], [removed], [id_course]) VALUES (32, N'M44', 0, 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (1, 0, N'Primeira Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (2, 0, N'Primeira Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (3, 0, N'Primeira Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (4, 0, N'Primeira Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (5, 0, N'Primeira Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (6, 0, N'Primeira Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (7, 0, N'Primeira Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (8, 0, N'Primeira Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (9, 0, N'Segunda Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (10, 0, N'Segunda Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (11, 0, N'Segunda Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (12, 0, N'Segunda Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (13, 0, N'Segunda Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (14, 0, N'Segunda Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (15, 0, N'Segunda Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (16, 0, N'Segunda Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (17, 0, N'Terceira Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (18, 0, N'Terceira Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (19, 0, N'Terceira Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (20, 0, N'Terceira Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (21, 0, N'Terceira Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (22, 0, N'Terceira Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (23, 0, N'Terceira Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (24, 0, N'Terceira Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (25, 0, N'Quarta Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (26, 0, N'Quarta Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (27, 0, N'Quarta Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (28, 0, N'Quarta Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (29, 0, N'Quarta Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (30, 0, N'Quarta Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (31, 0, N'Quarta Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (32, 0, N'Quarta Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (33, 0, N'Quinta Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (34, 0, N'Quinta Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (35, 0, N'Quinta Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (36, 0, N'Quinta Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (37, 0, N'Quinta Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (38, 0, N'Quinta Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (39, 0, N'Quinta Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (40, 0, N'Quinta Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (41, 0, N'Sexta Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (42, 0, N'Sexta Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (43, 0, N'Sexta Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (44, 0, N'Sexta Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (45, 0, N'Sexta Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (46, 0, N'Sexta Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (47, 0, N'Sexta Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (48, 0, N'Sexta Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (49, 0, N'Sétima Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (50, 0, N'Sétima Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (51, 0, N'Sétima Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (52, 0, N'Sétima Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (53, 0, N'Sétima Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (54, 0, N'Sétima Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (55, 0, N'Sétima Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (56, 0, N'Sétima Turma de Matemática', 8)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (57, 0, N'Oitava Turma de Software', 1)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (58, 0, N'Oitava Turma de Comp', 2)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (59, 0, N'Oitava Turma de Analise', 3)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (60, 0, N'Oitava Turma de Controle', 4)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (61, 0, N'Oitava Turma de Mecânica', 5)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (62, 0, N'Oitava Turma de Elétrica', 6)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (63, 0, N'Oitava Turma de Eletronica', 7)
INSERT [Classes].[courses_classes_contents] ([id_courses_classes_contents], [removed], [Descriptiona], [id_course_class]) VALUES (64, 0, N'Oitava Turma de Matemática', 8)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (1, 32, 21, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (2, 31, 22, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (3, 30, 23, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (4, 29, 24, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (5, 28, 25, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (6, 27, 26, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (7, 26, 27, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (8, 25, 28, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (9, 24, 29, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (10, 23, 30, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (11, 22, 31, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (12, 21, 32, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (13, 20, 33, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (14, 19, 34, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (15, 18, 35, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (16, 17, 36, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (17, 16, 37, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (18, 15, 38, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (19, 14, 39, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (20, 13, 40, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (21, 12, 41, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (22, 11, 42, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (23, 10, 43, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (24, 10, 43, 0, 1)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (25, 9, 44, 0, 1)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (26, 8, 45, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (27, 7, 46, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (28, 6, 47, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (29, 5, 48, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (30, 4, 49, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (31, 3, 50, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (32, 2, 45, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (33, 1, 46, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (34, 6, 21, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (35, 5, 22, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (36, 4, 23, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (37, 3, 22, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (38, 2, 21, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (39, 1, 50, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (40, 6, 35, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (41, 5, 36, 0, 0)
INSERT [Classes].[courses_classes_students] ([id_course_class_student], [id_course_class], [id_user], [removed], [student_score]) VALUES (42, 4, 40, 0, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (1, 17, 1, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (2, 31, 7, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (3, 10, 2, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (4, 27, 3, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (5, 20, 4, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (6, 13, 5, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (7, 14, 6, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (8, 32, 8, 0)
INSERT [Classes].[courses_classes_tutors] ([id_course_classes_tutors], [id_course_class], [id_course_tutor], [removed]) VALUES (9, 11, 1, 0)
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (1, 1, 0, N'Trabs pra software', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (2, 2, 0, N'Trabs pra comp', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (3, 3, 0, N'Trabs pra analise', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (4, 4, 0, N'Trabs pra controle', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (5, 5, 0, N'Trabs pra mecanica', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (6, 6, 0, N'Trabs pra eletrica', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (7, 7, 0, N'Trabs pra eletronica', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (8, 8, 0, N'Trabs pra matematica', CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (9, 9, 0, N'Trabs pra software', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (10, 10, 0, N'Trabs pra comp', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (11, 11, 0, N'Trabs pra analise', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (12, 12, 0, N'Trabs pra controle', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (13, 13, 0, N'Trabs pra mecanica', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (14, 14, 0, N'Trabs pra eletrica', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (15, 15, 0, N'Trabs pra eletronica', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities] ([id_activity], [id_course_class], [removed], [Descriptiona], [scheduled_date]) VALUES (16, 16, 0, N'Trabs pra matematica', CAST(N'2018-03-30T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (1, 16, 17, 0, CAST(N'2018-03-29T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (2, 12, 21, 0, CAST(N'2018-03-31T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (3, 5, 29, 0, CAST(N'2018-03-20T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (4, 5, 35, 0, CAST(N'2018-03-19T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (5, 5, 41, 0, CAST(N'2018-03-21T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (6, 1, 20, 0, CAST(N'2019-05-07T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (7, 2, 22, 0, CAST(N'2019-05-07T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (8, 3, 23, 0, CAST(N'2019-05-07T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (9, 4, 24, 0, CAST(N'2018-03-19T00:00:00.000' AS DateTime))
INSERT [Contents].[courses_classes_activities_students] ([id_activity_classes_students], [id_activity], [id_course_class_student], [removed], [delivery_date]) VALUES (10, 5, 25, 0, CAST(N'2016-05-07T00:00:00.000' AS DateTime))
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (1, N'Engenharia de Software', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (2, N'Engenharia de Computação', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (3, N'Análise e Dev de Sistemas', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (4, N'Engenharia de Controle e Automação', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (5, N'Engenharia Mecânica', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (6, N'Engenharia Elétrica', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (7, N'Engenharia Eletrônica', 0)
INSERT [Courses].[Courses] ([id_course], [names], [removed]) VALUES (8, N'Matemática', 0)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (1, 1, 7)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (2, 2, 10)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (3, 3, 16)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (4, 4, 17)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (5, 5, 20)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (6, 6, 1)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (7, 7, 3)
INSERT [Courses].[Tutors] ([id_course_tutor], [id_course], [id_user]) VALUES (8, 8, 8)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (1, N'Kyra', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (2, N'Simone', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (3, N'Kelsey', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (4, N'Jaquelyn', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (5, N'Ora', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (6, N'Lucy', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (7, N'Yuri', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (8, N'Sharon', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (9, N'Zenia', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (10, N'Lara', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (11, N'Serina', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (12, N'Maite', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (13, N'Erica', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (14, N'Skyler', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (15, N'Eliana', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (16, N'Margaret', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (17, N'Kim', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (18, N'Inga', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (19, N'Emi', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (20, N'Alyssa', 0, 1)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (21, N'Nerea', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (22, N'Dora', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (23, N'Karleigh', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (24, N'Chelsea', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (25, N'Guinevere', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (26, N'Pandora', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (27, N'Xerxes', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (28, N'Ariel', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (29, N'Scarlett', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (30, N'Ruby', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (31, N'Octavia', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (32, N'Shelley', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (33, N'Halee', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (34, N'Winter', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (35, N'Flavia', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (36, N'Urielle', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (37, N'Nyssa', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (38, N'Katell', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (39, N'Jael', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (40, N'Amethyst', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (41, N'Denise', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (42, N'Jasmine', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (43, N'Petra', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (44, N'Isabella', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (45, N'Evangeline', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (46, N'Jolene', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (47, N'Casey', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (48, N'Frances', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (49, N'Jenette', 0, 2)
INSERT [Persons].[Users] ([id_user], [names], [removed], [id_user_type]) VALUES (50, N'Gretchen', 0, 2)
INSERT [Persons].[users_types] ([id_user_type], [name], [removed]) VALUES (1, N'Tutor', 0)
INSERT [Persons].[users_types] ([id_user_type], [name], [removed]) VALUES (2, N'Aluno', 0)
ALTER TABLE [Classes].[courses_classes_students] ADD  DEFAULT ((0)) FOR [student_score]
GO
ALTER TABLE [Classes].[courses_classes]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [Courses].[Courses] ([id_course])
GO
ALTER TABLE [Classes].[courses_classes_contents]  WITH CHECK ADD FOREIGN KEY([id_course_class])
REFERENCES [Classes].[courses_classes] ([id_course_class])
GO
ALTER TABLE [Classes].[courses_classes_schedule]  WITH CHECK ADD FOREIGN KEY([id_course_class])
REFERENCES [Classes].[courses_classes] ([id_course_class])
GO
ALTER TABLE [Classes].[courses_classes_students]  WITH CHECK ADD FOREIGN KEY([id_course_class])
REFERENCES [Classes].[courses_classes] ([id_course_class])
GO
ALTER TABLE [Classes].[courses_classes_students]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [Persons].[Users] ([id_user])
GO
ALTER TABLE [Classes].[courses_classes_tutors]  WITH CHECK ADD FOREIGN KEY([id_course_class])
REFERENCES [Classes].[courses_classes] ([id_course_class])
GO
ALTER TABLE [Classes].[courses_classes_tutors]  WITH CHECK ADD FOREIGN KEY([id_course_tutor])
REFERENCES [Courses].[Tutors] ([id_course_tutor])
GO
ALTER TABLE [Contents].[assessements_students]  WITH CHECK ADD FOREIGN KEY([id_assessment])
REFERENCES [Contents].[courses_classes_assessements] ([id_assessment])
GO
ALTER TABLE [Contents].[assessements_students]  WITH CHECK ADD FOREIGN KEY([id_course_class_student])
REFERENCES [Classes].[courses_classes_students] ([id_course_class_student])
GO
ALTER TABLE [Contents].[courses_classes_activities]  WITH CHECK ADD FOREIGN KEY([id_course_class])
REFERENCES [Classes].[courses_classes] ([id_course_class])
GO
ALTER TABLE [Contents].[courses_classes_activities_students]  WITH CHECK ADD FOREIGN KEY([id_activity])
REFERENCES [Contents].[courses_classes_activities] ([id_activity])
GO
ALTER TABLE [Contents].[courses_classes_activities_students]  WITH CHECK ADD FOREIGN KEY([id_course_class_student])
REFERENCES [Classes].[courses_classes_students] ([id_course_class_student])
GO
ALTER TABLE [Contents].[courses_classes_assessements]  WITH CHECK ADD FOREIGN KEY([id_course_class])
REFERENCES [Classes].[courses_classes] ([id_course_class])
GO
ALTER TABLE [Courses].[Tutors]  WITH CHECK ADD FOREIGN KEY([id_course])
REFERENCES [Courses].[Courses] ([id_course])
GO
ALTER TABLE [Courses].[Tutors]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [Persons].[Users] ([id_user])
GO
ALTER TABLE [Persons].[Users]  WITH CHECK ADD FOREIGN KEY([id_user_type])
REFERENCES [Persons].[users_types] ([id_user_type])
GO
ALTER TABLE [Persons].[users_login]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [Persons].[Users] ([id_user])
GO
USE [master]
GO
ALTER DATABASE [rogerinho] SET  READ_WRITE 
GO
