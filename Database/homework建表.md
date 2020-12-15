## 前端：

1.跳转逻辑

2.删掉小组

3.我的课程删掉，从侧边栏跳转

4.教师界面复用学生界面，删掉一部分功能

5.添加课程放在主页跳转并重新设计界面







## 后端

1.作业表的设计： mysql中建个表，user_id， homework_id，state

homework表：

|             |      |
| ----------- | ---- |
| homework_id |      |
| start_time  |      |
| end_time    |      |



answer表

|             |                             |
| ----------- | --------------------------- |
| homework_id |                             |
| student_id  |                             |
| status      | 待做 已提交 已保存 超时提交 |
| commit_time |                             |
|             |                             |

