// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class AppLocalization {
//   final Locale locale;
//
//   AppLocalization(this.locale);
//
//   static AppLocalization of(BuildContext context) {
//     return Localizations.of(context, AppLocalization);
//   }
//
//   static final Map<String, Map<String, String>> _strings = {
//     'en': {
//       'confirm': 'Confirm',
//       'errorWhileLoadingHome': 'Error while loading home',
//       'errorWhileLogin': 'Error while trying to login',
//       'login': 'Login',
//       'perfil': 'Perfil',
//       'selected': '{1} selected',
//       'tryAgain': 'Try again',
//     },
//     'pt': {
//       'confirm': 'Confirmar',
//       'errorWhileLoadingHome': 'Erro ao carregar página inicial',
//       'errorWhileLogin': 'Erro ao tentar fazer login',
//       'login': 'Login', // ou Entrar
//       'perfil': 'Perfil',
//       'selected': '{1} selecionado(s)',
//       'tryAgain': 'Tentar Novamente',
//     },
//   };
//
//   // If string for "label" does not exist, will show "[LABEL]"
//   String _get(String label) {
//     // Tenta obter a string para o locale atual (ex: 'pt_BR' ou 'pt')
//     // Se não encontrar para 'pt_BR', tenta para 'pt' (linguagem base)
//     // Se ainda não encontrar, usa o inglês como fallback
//     // Se não encontrar no inglês, mostra a label em maiúsculas
//     return _strings[locale.languageCode]?[label] ??
//         _strings['en']?[label] ??
//         '[${label.toUpperCase()}]';
//   }
//
//   String get confirm => _get('confirm');
//
//   String get errorWhileLoadingHome => _get('errorWhileLoadingHome');
//
//   String get errorWhileLogin => _get('errorWhileLogin');
//
//   String get login => _get('login');
//
//   String get perfil => _get('perfil');
//
//   String get tryAgain => _get('tryAgain');
//
//   String selected(int value) =>
//       _get('selected').replaceAll('{1}', value.toString());
// }
//
// class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
//   @override
//   bool isSupported(Locale locale) => locale.languageCode == 'en';
//
//   @override
//   Future<AppLocalization> load(Locale locale) {
//     return SynchronousFuture(AppLocalization());
//   }
//
//   @override
//   bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
//       false;
// }
