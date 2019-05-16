<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19-5-16
  Time: 上午10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>test-map</title>

  </head>
  <body>
  折线图：<div id="d1" style="width:700px; height: 300px;"></div>
  柱状：<div id="d2" style="width:700px; height: 300px;"></div>
  饼图：<div id="d3" style="width:700px; height: 300px;"></div>
  仪表盘：<div id="d4" style="width:700px; height: 300px;"></div>
  数据地图：<div id="d5" style="width:800px; height: 600px;"></div>
  地图:<div id="china-map" style="width:800px; height: 600px;"></div>
  饼图：<div id="d6" style="width:800px; height: 600px;"></div>

  <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="js/echarts/echarts.min.js"></script>
  <script type="text/javascript" src="js/echarts/china.js" ></script>
  <script type="text/javascript">
      //指定图标的配置和数据
      var option1 = {
          title:{
              text:'折线 数据统计'
          },
          tooltip:{},
          legend:{
              data:['用户来源']
          },
          xAxis:{
              data:["Android","IOS","PC","Ohter"]
          },
          yAxis:{

          },
          series:[{
              name:'用户来源',
              type:'line',
              data:[500,200,360,100]
          }]
      };

      //初始化echarts实例
      var myChart1 = echarts.init($("#d1").get(0));

      //使用制定的配置项和数据显示图表
      myChart1.setOption(option1);
      //指定图标的配置和数据
      var option2 = {
          title:{
              text:'柱状 数据统计'
          },
          tooltip:{},
          legend:{
              data:['访问量']
          },
          xAxis:{
              data:["Android","IOS","PC","Ohter"]
          },
          yAxis:{

          },
          series:[{
              name:'访问量',
              type:'bar',
              data:[500,200,360,100]
          }]
      };

      //初始化echarts实例
      var myChart2 = echarts.init($("#d2").get(0));
      //使用制定的配置项和数据显示图表
      myChart2.setOption(option2);
      //指定图标的配置和数据
      var option3 = {
          title : {
              text: ' 饼图 数据统计',
              subtext: '纯属虚构',
              x:'center'
          },
          tooltip : {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
              orient : 'vertical',
              x : 'left',
              data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
          },
          calculable : true,
          series : [
              {
                  name:'访问来源',
                  type:'pie',
                  radius : '55%',
                  center: ['50%', '60%'],
                  data:[
                      {value:335, name:'直接访问'},
                      {value:310, name:'邮件营销'},
                      {value:234, name:'联盟广告'},
                      {value:135, name:'视频广告'},
                      {value:1548, name:'搜索引擎'}
                  ]
              }
          ]
      };

      //初始化echarts实例
      var myChart3 = echarts.init($("#d3").get(0));
      //使用制定的配置项和数据显示图表
      myChart3.setOption(option3);
      var option4 = {
          tooltip : {
              formatter: "{a} <br/>{b} : {c}%"
          },
          series : [
              {
                  name:'业务指标',
                  type:'gauge',
                  detail : {formatter:'{value}%'},
                  data:[{value: 50, name: '完成率'}]
              }
          ]
      };

      clearInterval(timeTicket);
      var timeTicket = setInterval(function (){
          option4.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
          myChart4.setOption(option4, true);
      },2000);
      //初始化echarts实例
      var myChart4 = echarts.init($("#d4").get(0));
      //使用制定的配置项和数据显示图表
      myChart4.setOption(option4);
      var option5 = {
          title : {
              text: '2011全国GDP（亿元）',
              subtext: '数据来自国家统计局'
          },
          tooltip : {
              trigger: 'item'
          },
          legend: {
              x:'left',
              data:['北京','上海','广东']
          },
          dataRange: {
              orient: 'horizontal',
              min: 0,
              max: 55000,
              text:['高','低'],           // 文本，默认为数值文本
              splitNumber:0
          },
          series : [
              {
                  name: '2011全国GDP分布',
                  type: 'map',
                  mapType: 'china',
                  mapLocation: {
                      x: 'left'
                  },
                  selectedMode : 'multiple',
                  itemStyle:{
                      normal:{label:{show:true}},
                      emphasis:{label:{show:true}}
                  },
                  data:[
                      {name:'西藏', value:605.83},
                      {name:'青海', value:1670.44},
                      {name:'宁夏', value:2102.21},
                      {name:'海南', value:2522.66},
                      {name:'甘肃', value:5020.37},
                      {name:'贵州', value:5701.84},
                      {name:'新疆', value:6610.05},
                      {name:'云南', value:8893.12},
                      {name:'重庆', value:10011.37},
                      {name:'吉林', value:10568.83},
                      {name:'山西', value:11237.55},
                      {name:'天津', value:11307.28},
                      {name:'江西', value:11702.82},
                      {name:'广西', value:11720.87},
                      {name:'陕西', value:12512.3},
                      {name:'黑龙江', value:12582},
                      {name:'内蒙古', value:14359.88},
                      {name:'安徽', value:15300.65},
                      {name:'北京', value:16251.93, selected:true},
                      {name:'福建', value:17560.18},
                      {name:'上海', value:19195.69, selected:true},
                      {name:'湖北', value:19632.26},
                      {name:'湖南', value:19669.56},
                      {name:'四川', value:21026.68},
                      {name:'辽宁', value:22226.7},
                      {name:'河北', value:24515.76},
                      {name:'河南', value:26931.03},
                      {name:'浙江', value:32318.85},
                      {name:'山东', value:45361.85},
                      {name:'江苏', value:49110.27},
                      {name:'广东', value:53210.28, selected:true}
                  ]
              }
          ],
          animation: false
      };
      //初始化echarts实例
      var myChart5 = echarts.init($("#d5").get(0));
      //使用制定的配置项和数据显示图表
      myChart5.setOption(option5);
      function randomData() {
          return Math.round(Math.random()*500);
      }
      var mydata = [
          {name: '北京',value: '100' },{name: '天津',value: randomData() },
          {name: '上海',value: randomData() },{name: '重庆',value: randomData() },
          {name: '河北',value: randomData() },{name: '河南',value: randomData() },
          {name: '云南',value: randomData() },{name: '辽宁',value: randomData() },
          {name: '黑龙江',value: randomData() },{name: '湖南',value: randomData() },
          {name: '安徽',value: randomData() },{name: '山东',value: randomData() },
          {name: '新疆',value: randomData() },{name: '江苏',value: randomData() },
          {name: '浙江',value: randomData() },{name: '江西',value: randomData() },
          {name: '湖北',value: randomData() },{name: '广西',value: randomData() },
          {name: '甘肃',value: randomData() },{name: '山西',value: randomData() },
          {name: '内蒙古',value: randomData() },{name: '陕西',value: randomData() },
          {name: '吉林',value: randomData() },{name: '福建',value: randomData() },
          {name: '贵州',value: randomData() },{name: '广东',value: randomData() },
          {name: '青海',value: randomData() },{name: '西藏',value: randomData() },
          {name: '四川',value: randomData() },{name: '宁夏',value: randomData() },
          {name: '海南',value: randomData() },{name: '台湾',value: randomData() },
          {name: '香港',value: randomData() },{name: '澳门',value: randomData() }
      ];
      var optionMap = {
          /*backgroundColor: '#FFFFFF',*/

          title: {
              text: '全国地图大数据',
              subtext: '',
              x:'center'
          },
          tooltip : {
              trigger: 'item'
          },

          //左侧小导航图标
          visualMap: {
              show : true,
              x: 'right',
              y: 'center',
              splitList: [
                  {start: 500, end:600},{start: 400, end: 500},
                  {start: 300, end: 400},{start: 200, end: 300},
                  {start: 100, end: 200},{start: 0, end: 100},
              ],
              color: ['#5475f5', '#9feaa5', '#85daef','#74e2ca', '#e6ac53', '#9fb5ea']
          },

          //配置属性
          series: [{
              name: '数据',
              type: 'map',
              mapType: 'china',
              selectedMode: 'single',
              roam: false,
              zoom: 1.1,
              label: {
                  normal: {
                      show: true  //省份名称
                  },
                  emphasis: {
                      show: false
                  }
              },
              data: mydata  //数据
          }]
      };
      //初始化echarts实例
      //var myChart6 = echarts.init($("#d6").get(0));

      //使用制定的配置项和数据显示图表
      //myChart6.setOption(optionMap);

      var myChart = echarts.init($("#d6").get(0));
      var mapHash = { "河北": "hebei", "山西": "shanxi", "内蒙古": "neimenggu", "辽宁": "liaoning",
          "吉林": "jilin", "黑龙江": "heilongjiang", "江苏": "jiangsu", "浙江": "zhejiang",
          "安徽": "anhui", "福建": "fujian", "江西": "jiangxi", "山东": "shandong", "河南": "henan",
          "湖北": "hubei", "湖南": "hunan", "广东": "guangdong", "广西": "guangxi",
          "海南": "hainan", "四川": "sichuan", "贵州": "guizhou", "云南": "yunnan",
          "西藏": "xizang", "陕西": "shanxi1", "甘肃": "gansu", "青海": "qinghai", "宁夏": "ningxia",
          "新疆": "xinjiang", "北京": "beijing", "天津": "tianjin", "上海": "shanghai",
          "重庆": "chongqing", "香港": "xianggang", "澳门": "aomen", "台湾": "taiwan" };
      //var pName = GetQueryString("pName");
      var pName="重庆";
      showProvince(pName,mapHash[pName]);

      function showProvince(pName,name) {

          $.get('/js/echarts/province/' + name + '.json', function (geoJson) {
              //console.log(geoJson.features);
              var mapArr=geoJson.features;
              var cityArr=[];
              var severData=[
                  { id:"500112",name: '渝北区', value: Math.round(Math.random() * 1000) },
                  { id:"500235",name: '云阳县', value: Math.round(Math.random() * 1000) }
              ];
              //alert($.inArray("a",["a","b"]))
              var idArr=[];
              $.each(function(i,severData){
                  idArr.push(severData.id);
              })
              $.each(mapArr,function(i,map){
                  var obj={};
                  obj.id=map.id;
                  obj.name=map.properties.name;
                  cityArr.push(obj);
                  if($.inArray(obj.id,idArr)>0 ){
                      obj.value=Math.round(Math.random() * 1000);
                  }
                  severData.push(obj);
              });
              //$("#d6").data("cityData",cityArr);
              echarts.registerMap(name, geoJson);
              myChart.setOption(option = {
                  //backgroundColor: '#404a59',
                  tooltip: {
                      trigger: 'item'
                  },
                  title: {
                      text: pName+'大数据',
                      left: 'center'
                  },
                  legend: {
                      x: 'right',
                      data: ['订单数据']
                  },
                  dataRange:
                      {
                          orient: 'vertical',
                          x: 'left',
                          min: 0,
                          max: 1000,
                          color: ['orange', 'yellow'],
                          text: ['高', '低'],           // 文本，默认为数值文本
                          splitNumber: 0
                      },
                  series: [
                      {
                          name: '订单数据',
                          type: 'map',
                          mapType: name,
                          label: {

                              emphasis: {
                                  textStyle: {
                                      color: '#fff'
                                  }
                              }
                          },
                          itemStyle: {

                              normal: {
                                  borderColor: '#389BB7',
                                  areaColor: '#fff',
                                  label: { show: false }
                              },
                              emphasis: {
                                  areaColor: '#389BB7',
                                  borderWidth: 0,
                                  label: { show: true }
                              }
                          },
                          showLegendSymbol: false, //去掉地图的上标志点
                          animation: false,
                          roam: true,
                          data:severData
                      }
                  ]
              });
          });
      }
      myChart.on('click', function (params) {
          //console.log(params);
          console.log(params.data.id);
          console.log(params.name);
      });

      var myChart7 = echarts.init(document.getElementById('china-map'));
      var option7 = {
          tooltip: {
              //show: false //不显示提示标签
              formatter: '{b}', //提示标签格式
              backgroundColor: "#ff7f50",//提示标签背景颜色
              textStyle: {color: "#fff"} //提示标签字体颜色
          },
          series: [{
              type: 'map',
              mapType: 'china',
              label: {
                  normal: {
                      show: true,//显示省份标签
                      textStyle: {color: "#c71585"}//省份标签字体颜色
                  },
                  emphasis: {//对应的鼠标悬浮效果
                      show: true,
                      textStyle: {color: "#800080"}
                  }
              },
              itemStyle: {
                  normal: {
                      borderWidth: .5,//区域边框宽度
                      borderColor: '#009fe8',//区域边框颜色
                      areaColor: "#ffefd5",//区域颜色
                  },
                  emphasis: {
                      borderWidth: .5,
                      borderColor: '#4b0082',
                      areaColor: "#ffdead",
                  }
              },
              data: [
                  {name: '福建', selected: true}//福建为选中状态
              ]
          }],
      };
      myChart7.setOption(option7);
  </script>
  </body>
</html>
