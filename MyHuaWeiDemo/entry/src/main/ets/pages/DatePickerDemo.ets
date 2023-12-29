@Entry
@Component
struct DatePickerDialogDemo{
  selectedDate: Date = new Date();
  // 日期选择器
  build(){
    Column(){
      Button("DatePickerDialog")
        .margin(20)
        .onClick(()=>{
          DatePickerDialog.show({
            start:new Date('1990-1-1'),
            end:new Date('2100-1-1'),
            selected:this.selectedDate,
            lunar:false,
            onAccept:(value:DatePickerResult)=>{
              this.selectedDate.setFullYear(value.year,value.month,value.day)
              console.log(JSON.stringify(value))
            },
            onCancel:()=>{
              console.log('CANCEL')
            },
            onChange:(value:DatePickerResult)=>{
              console.log(JSON.stringify(value))
            }
          })
        })
    }.width('100%')
  }
}