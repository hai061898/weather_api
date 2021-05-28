import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/models/WeatherModel.dart';
import 'package:weather/service/WeatherApi.dart';
class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
 
}

class FetchWeather extends WeatherEvent{
  final _city;

  FetchWeather(this._city);

  @override
  // TODO: implement props
  List<Object> get props => [_city];
}

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class WeatherIsNotSearched extends WeatherState{

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather; // gọi hàm getter 

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState{

}
class ResetWeather extends WeatherEvent{

}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{

  WeatherResponse weatherRepo; // gội biến từ api

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()); // khởi tạo biến

  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchWeather){
      yield WeatherIsLoading();// load dữ liệu

      try{
       WeatherModel weather = await weatherRepo.getWeather(event._city); // tạo biến gán khi lấy dư liệu
        yield WeatherIsLoaded(weather); // thực thi hành đồng try load dữ liệu
      }catch(_){
        print(_);
        yield WeatherIsNotLoaded(); // không load dữ liệu 
      }
    }else if(event is ResetWeather){
      yield WeatherIsNotSearched(); // thực thi không search 
    }
  }
}