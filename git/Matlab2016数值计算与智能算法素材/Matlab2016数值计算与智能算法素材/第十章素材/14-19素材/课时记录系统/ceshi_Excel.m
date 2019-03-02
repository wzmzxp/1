function ceshi_Excel
%利用MATLAB生成Excel文档
%   ceshi_Excel
%
%   Copyright 2009 - 2010 xiezhh.
%   $Revision: 1.0.0.0 $  $Date: 2009/12/14 20:40:00 $
filespec_user = [pwd '\测试.xls'];
try
    Excel = actxGetRunningServer('Excel.Application');
catch
    Excel = actxserver('Excel.Application');
end;
Excel.Visible = 1;    % set(Excel, 'Visible', 1);
if exist(filespec_user,'file')
    Workbook = Excel.Workbooks.Open(filespec_user);
    % Workbook = invoke(Excel.Workbooks,'Open',filespec_user);
else
    Workbook = Excel.Workbooks.Add;
    % Workbook = invoke(Excel.Workbooks, 'Add');
    Workbook.SaveAs(filespec_user);  
end
Sheets = Excel.ActiveWorkbook.Sheets;    % Sheets = Workbook.Sheets;
Sheet1 = Sheets.Item(1);
Sheet1.Activate;
Sheet1.PageSetup.TopMargin = 60;
Sheet1.PageSetup.BottomMargin = 45;
Sheet1.PageSetup.LeftMargin = 45;
Sheet1.PageSetup.RightMargin = 45;
RowHeight = [26,22,15,29,37,29,29,25,25,36,280,31,40,29,15,24]';
Sheet1.Range('A1:A16').RowHeight = RowHeight;
Sheet1.Range('A1:H1').ColumnWidth = [9,15,9,9,9,9,9,9];
Sheet1.Range('A1:H1').MergeCells = 1;
Sheet1.Range('A2:H2').MergeCells = 1;
Sheet1.Range('A8:A9').MergeCells = 1;
Sheet1.Range('B8:D8').MergeCells = 1;
Sheet1.Range('E8:H8').MergeCells = 1;
Sheet1.Range('B9:D9').MergeCells = 1;
Sheet1.Range('E9:H9').MergeCells = 1;
Sheet1.Range('A10:H10').MergeCells = 1;
Sheet1.Range('A11:H11').MergeCells = 1;
Sheet1.Range('A12:H12').MergeCells = 1;
Sheet1.Range('A13:H13').MergeCells = 1;
Sheet1.Range('A14:H14').MergeCells = 1;
Sheet1.Range('D16:H16').MergeCells = 1;
Sheet1.Range('A4:H14').Borders.Weight = 3;
Sheet1.Range('A10:H12').Borders.Item(3).Linestyle = 0;
Sheet1.Range('A10:H12').Borders.Item(4).Linestyle = 0;
Sheet1.Range('A13:H13').Borders.Item(4).Linestyle = 0;
Sheet1.Range('A14:H14').Borders.Item(3).Linestyle = 0;
Sheet1.Range('A1:H9').HorizontalAlignment = 3;
Sheet1.Range('A4:A9').HorizontalAlignment = 6;
Sheet1.Range('C4:C7').HorizontalAlignment = 6;
Sheet1.Range('E4:E7').HorizontalAlignment = 6;
Sheet1.Range('G4:G7').HorizontalAlignment = 6;
Sheet1.Range('A10:H10').HorizontalAlignment = 6;
Sheet1.Range('A11:H11').HorizontalAlignment = 6;    % -4130
Sheet1.Range('A11:H11').VerticalAlignment = 1;
Sheet1.Range('A12:H12').HorizontalAlignment = 4;
Sheet1.Range('A13:H13').VerticalAlignment = 1;
Sheet1.Range('A14:H14').HorizontalAlignment = 4;
Sheet1.Range('D16:H16').HorizontalAlignment = 4;
Sheet1.Range('A1').Value = '试  卷  分  析';
Sheet1.Range('A2').Value = '（ 2009  —  2010   学年 第一学期）';
Sheet1.Range('A4:H4').Value = {'课程名称','','课程号',...
'','任课教师学院','','任课教师',''};
Sheet1.Range('A5:H5').Value = {'授课班级','','考试日期',...
'','应考人数','','实考人数',''};
Sheet1.Range('A6:H6').Value = {'出卷方式','','阅卷方式',...
'','选用试卷A/B','','考试时间',''};
Sheet1.Range('A7:H7').Value = {'考试方式','','平均分',...
'','不及格人数','','及格率',''};
Sheet1.Range('A8').Value = '成绩分布';
Sheet1.Range('B8').Value = '90分以上       人占        %';
Sheet1.Range('E8').Value = '80---89分        人占        %';
Sheet1.Range('B9').Value = '70---79分      人占        %';
Sheet1.Range('E9').Value = '60---69分        人占        %';
Sheet1.Range('A10').Value = ['试卷分析（含是否符合教学大纲、难度、知识覆'...
'盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中'...
'存在的问题及改进措施等内容）'];
Sheet1.Range('A12').Value = '签字 :                      年     月     日';
Sheet1.Range('A13').Value = '教研室审阅意见：';
Sheet1.Range('A14').Value = '教研室主任（签字）:             年    月    日';
Sheet1.Range('D16').Value = '主管院长签字：                  年    月    日';
Sheet1.Range('A4:H12').Font.size = 10.5;
Sheet1.Range('A1').Font.size = 16;
Sheet1.Range('A1').Font.bold = 2;
Shapes = Sheet1.Shapes;
if Shapes.Count ~= 0
    for i = 1 : Shapes.Count
        Shapes.Item(1).Delete;
    end;
end;

zft = figure('units','normalized','position',...
    [0.280469 0.553385 0.428906 0.251302],'visible','off');
set(gca,'position',[0.1 0.2 0.85 0.75]);
data = normrnd(75,4,1000,1);
hist(data);
grid on;
xlabel('考试成绩');
ylabel('人数');
hgexport(zft, '-clipboard');
Sheet1.Range('A11').Select;
Sheet1.Paste    % Sheet1.PasteSpecial;
delete(zft);
Workbook.Save   % 保存文档