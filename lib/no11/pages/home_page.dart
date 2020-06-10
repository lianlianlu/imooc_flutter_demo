import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:imoocflutterdemo/no11/dao/home_dao.dart';
import 'package:imoocflutterdemo/no11/model/common_model.dart';
import 'package:imoocflutterdemo/no11/model/grid_nav_model.dart';
import 'package:imoocflutterdemo/no11/model/home_model.dart';
import 'package:imoocflutterdemo/no11/model/sales_box_model.dart';
import 'package:imoocflutterdemo/no11/widget/grid_nav.dart';
import 'package:imoocflutterdemo/no11/widget/loading_container.dart';
import 'package:imoocflutterdemo/no11/widget/local_nav.dart';
import 'package:imoocflutterdemo/no11/widget/sales_box.dart';
import 'package:imoocflutterdemo/no11/widget/sub_nav.dart';

const APPBAR_SCROLL_OFFSET = 100; //滚动最大距离，当滚动到100时，完全变成白色

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  String resultString = "";
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  GridNavModel gridNavModel;
  List<CommonModel> subNavList = [];
  SalesBoxModel salesBox;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: [
              MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollNotification) {
                        if (scrollNotification is ScrollNotification &&
                            scrollNotification.depth == 0) {
                          //滚动且是列表滚动的时候
                          _onScroll(scrollNotification.metrics.pixels);
                        }
                        return true;
                      },
                      child: _listView,
                    ),
                  )),
              _appBar
            ],
          ),
        ));
  }

  void _onScroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  Future<Null> _handleRefresh() async {
    ///方法二
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
        salesBox = model.salesBox;
        bannerList = model.bannerList;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        //resultString = e.toString();
      });
    }

    return null;
  }

  Widget get _listView {
    return ListView(
      children: [
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(localNavList: localNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNav(gridNavModel: gridNavModel),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: Sub(subNavList: subNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SalesBox(salesBox: salesBox),
        )
      ],
    );
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                print('跳转');
              },
              child: Image.network(
                bannerList[index].icon,
                fit: BoxFit.fill,
              ));
        },
        pagination: new SwiperPagination(),
      ),
    );
  }

  Widget get _appBar {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页22'),
          ),
        ),
      ),
    );
  }
}
