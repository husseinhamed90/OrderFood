abstract class CubitState{}

class initialState extends CubitState{}
class ValidUserState extends CubitState{}
class InvalidUserState extends CubitState{}

class loadingCategorieeFromFireBase extends CubitState{}
class LoadingIsFinished extends CubitState{}


class DataisInLoadingPahse extends CubitState{}
class DataisInLoaded extends CubitState{}

class UserRegistered extends CubitState{}
class InvalidRegisteration extends CubitState{}

class LoadingIndicator extends CubitState{}

class positionchanged extends CubitState{}
class GoToNextPageState extends CubitState{}

class EmptyFeildsFound extends CubitState{}

class setcontroll extends CubitState{}
class AccountisUpdated extends CubitState{}

class MealAddedToAccount extends CubitState{}
class MealAddedToFavourite extends CubitState{}

class AddMealToCartLoadingState extends CubitState{}

class quantityofMealIncreased extends CubitState{}
class quantityofMealDecreased extends CubitState{}