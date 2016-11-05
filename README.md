# DSLTextViewPlaceholder
textView placeholder and maxLength

使用方法：
```
#import "UITextView+DSLPlaceholder.h"


//设置placeholder
_textView.dsl_textView_placeholder = @"最多输入50个字符..";

//限制最大输入长度
_textView.dsl_textView_maxLength = 50;

//placeholder颜色，默认0xbfbfbf
//_textView.dsl_textView_placeholder_color = [UIColor purpleColor];

//placeholder字体大小，不传默认与textView的字体大小一致
//_textView.dsl_textView_placeholder_fontSize = 16;
```
