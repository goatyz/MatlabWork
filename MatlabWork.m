function image_processing_gui
    % 创建主界面
    fig = figure('Name', '图像处理工具', 'NumberTitle', 'off', 'Position', [100, 100, 800, 600]);

    % 按钮和菜单
    uicontrol('Style', 'pushbutton', 'String', '加载图像', 'Position', [50, 550, 100, 30], 'Callback', @load_image);
    uicontrol('Style', 'pushbutton', 'String', '显示直方图', 'Position', [50, 500, 100, 30], 'Callback', @show_histogram);
    uicontrol('Style', 'pushbutton', 'String', '直方图均衡化', 'Position', [50, 450, 100, 30], 'Callback', @hist_eq);
    uicontrol('Style', 'pushbutton', 'String', '对比度增强', 'Position', [50, 400, 100, 30], 'Callback', @contrast_enhance);
    uicontrol('Style', 'pushbutton', 'String', '图像旋转', 'Position', [50, 350, 100, 30], 'Callback', @rotate_image);
    uicontrol('Style', 'pushbutton', 'String', '图像加噪', 'Position', [50, 300, 100, 30], 'Callback', @add_noise);
    uicontrol('Style', 'pushbutton', 'String', '边缘检测', 'Position', [50, 250, 100, 30], 'Callback', @edge_detection);
    uicontrol('Style', 'pushbutton', 'String', '提取特征', 'Position', [50, 200, 100, 30], 'Callback', @feature_extraction);
    uicontrol('Style', 'pushbutton', 'String', '图像分类', 'Position', [50, 150, 100, 30], 'Callback', @image_classification);

    % 图像显示区域
    ax = axes('Parent', fig, 'Position', [0.3, 0.1, 0.6, 0.8]);
    
    % 默认图像变量
    img = [];
    
    % 加载图像
    function load_image(~, ~)
        [file, path] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'});
        if file
            img = imread(fullfile(path, file));
            imshow(img, 'Parent', ax);
        end
    end

    % 显示灰度直方图
    function show_histogram(~, ~)
        if isempty(img)
            errordlg('请先加载图像！');
            return;
        end
        gray_img = rgb2gray(img);
        figure;
        imhist(gray_img);
        title('灰度直方图');
    end
end
