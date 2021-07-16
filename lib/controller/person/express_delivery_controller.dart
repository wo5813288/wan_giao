
import 'package:wan_android/bean/express_delivery_data.dart';
import 'package:wan_android/bean/logistics_data.dart';
import 'package:wan_android/compents/state_page.dart';
import 'package:wan_android/controller/base/base_getx_controller.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:get/get.dart';
import 'package:wan_android/http/request_api.dart';
class ExpressDeliveryController extends BaseGetXController{
  static  String url = "https://www.mxnzp.com/api/logistics/type/list?app_id=ofgmqilkocukdqjf&app_secret=by9GMlJjWVlkSzl1RVQvVW4rcGtGdz09";
  var _expressDeliverys = <ExpressDelivery>[].obs;
  var logisticsTypeName = "找不到快递公司?请选择".obs;
  var logisticsTypeId = 0.obs;
  List<ExpressDelivery> get expressDeliverys =>_expressDeliverys;
  var logistics =Logistics().obs;
  ///根据单号查询到对应的快递公司
  void getExpressBySingleNumber(String singleNumber){
    HttpManager.instance.get("",newUrl: RequestApi.QUERY_EXPRESS_BY_SINGLE_NUMBER(singleNumber)).then((value) {
      int code  = value['code'];
      if(code!=1){
        return;
      }
      Map<String,dynamic> data =value['data'];
      if(data==null) return;
      Map<String,dynamic> logistics = data['searchList'][0];
      logisticsTypeName.value = logistics['logisticsTypeName'];
      logisticsTypeId.value = logistics['logisticsTypeId'];
    });
  }

  ///查询物流信息
  /// singleNumber --被查询的快递单号
  /// logisticsId -- 单号对应的物流id
  void queryExpressInfo(String singleNumber,int logisticsId){
    loadState.value = LoadState.LOADING;
    HttpManager.instance.get("",newUrl: RequestApi.QUERY_EXPRESS_INFO(singleNumber,logisticsId)).then((value) {
      var logisticsData = LogisticsData.fromJson(value);
      if(logisticsData.code!=1){
        loadState.value=LoadState.FAILURE;
        exception.value = ResultException(logisticsData.code,logisticsData.msg);
        return;
      }
      logistics.value = logisticsData.data;
      loadState.value = LoadState.SUCCESS;
    });
  }

  @override
  void initData(bool isShowLoading) {
    if (isShowLoading) {
      loadState.value=LoadState.LOADING;
    }
    HttpManager.instance.get("",newUrl: url).then((value) {
      ExpressDeliveryData data =ExpressDeliveryData.fromJson(value);
      if(data.code!=1){
        if (isShowLoading) {
          loadState.value=LoadState.FAILURE;
        }
        exception.value = ResultException(data.code,data.msg);
      }else{
        _expressDeliverys.value = data.data;
        if(_expressDeliverys.isEmpty){
          loadState.value = LoadState.EMPTY;
          return;
        }
        loadState.value = LoadState.SUCCESS;
      }
    });
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData(false);
  }

}