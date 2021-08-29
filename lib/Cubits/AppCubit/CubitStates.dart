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
class MealAddedToCart extends CubitState{}

class AddMealToCartLoadingState extends CubitState{}

class quantityofMealIncreased extends CubitState{}
class quantityofMealDecreased extends CubitState{}

class mealInFavourites extends CubitState{}
class mealInCart extends CubitState{}

class mealDeletedFromUserMeals extends CubitState{}
class mealDeletedFromUserFavourites extends CubitState{}

class IncreamentCounter extends CubitState{}
class DecreamentCounter extends CubitState{}

class deleteMealFromFvouritesInProgess extends CubitState{}

class totalPriceIsCalculated extends CubitState{}

class addingMealToCartInProgress extends CubitState{}

class accountisReseted extends CubitState{}

class updateUserAccountInProgress extends CubitState{}

class ChangepayOnArrivalState extends CubitState{}

class AccountMealState extends CubitState{}

class setverificationIdStata extends CubitState{}

class goToOtpScreenToEnterOTPCode extends CubitState{}

class wrongOTPCode extends CubitState{}

class checkForValidDataAndValidNumber extends CubitState{}

class invalidNumber extends CubitState {}