import 'package:cafe_pra_ja/data/services/auth_service.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/error/not_found_page.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_bloc.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_event.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  /// bloc
  final perfilBloc = PerfilBloc();

  /// variaveis
  final user = AuthService.currentUser;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  /// init state
  @override
  void initState() {
    super.initState();
    perfilBloc.add(LoadProfileEvent());
  }

  /// Metodo

  /// Widget

  Widget _buildAuthenticatedProfile(PerfilSuccessState state) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('${CafeString.bemVindo} ${state.user.email}')],
          ),
        ),
      ),
    );
  }

  Widget _page(PerfilState state) {
    return state is PerfilSuccessState
        ? _buildAuthenticatedProfile(state)
        : NotFoundPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => perfilBloc..add(LoadProfileEvent()),
      child: BlocBuilder<PerfilBloc, PerfilState>(
        builder: (BuildContext context, PerfilState state) {
          switch (state) {
            case PerfilLoadingState():
              return Center(child: CircularProgressIndicator());
            case PerfilSuccessState():
              return _page(state);
            case PerfilErrorState():
              return Text('Error');
            default:
              return _page(state);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  //  return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(CafeString.perfil),
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       actions: [
  //         IconButton(
  //           icon: const Icon(Icons.logout),
  //           onPressed: () async {
  //             await FirebaseAuth.instance.signOut();
  //             context.go(Routes.perfil);
  //             // O redirect do GoRouter irá lidar com a navegação para /login
  //           },
  //         ),
  //       ],
  //     ),
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Center(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             GestureDetector(
  //               onTap: _pickImage,
  //               child: CircleAvatar(
  //                 radius: 60,
  //                 backgroundColor: Colors.grey[300],
  //                 backgroundImage:
  //                     _imageFile != null
  //                         ? FileImage(_imageFile!)
  //                         : _profileImagePath != null
  //                         ? NetworkImage(
  //                           _profileImagePath!,
  //                         ) // Assumindo que é um URL do Firebase Storage
  //                         : null,
  //                 child:
  //                     _imageFile == null && _profileImagePath == null
  //                         ? Icon(
  //                           Icons.camera_alt,
  //                           size: 50,
  //                           color: Colors.grey[700],
  //                         )
  //                         : null,
  //               ),
  //             ),
  //             const SizedBox(height: 8),
  //             TextButton(
  //               onPressed: _pickImage,
  //               child: const Text(CafeString.alterarFoto),
  //             ),
  //             const SizedBox(height: 30),
  //             _buildInfoCard(
  //               title: CafeString.informacoesPessoais,
  //               children: [
  //                 _buildInfoRow(
  //                   icon: Icons.person,
  //                   label: CafeString.nome,
  //                   value: _name,
  //                 ),
  //                 _buildInfoRow(
  //                   icon: Icons.email,
  //                   label: CafeString.email,
  //                   value: _email!,
  //                 ),
  //                 if (_phone != null && _phone!.isNotEmpty)
  //                   _buildInfoRow(
  //                     icon: Icons.phone,
  //                     label: CafeString.telefone,
  //                     value: _phone!,
  //                   ),
  //               ],
  //             ),
  //             const SizedBox(height: 30),
  //             ElevatedButton.icon(
  //               icon: const Icon(Icons.edit),
  //               label: const Text(CafeString.editarPerfil),
  //               onPressed: _showEditDialog,
  //               style: ElevatedButton.styleFrom(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 30,
  //                   vertical: 15,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //
  // Widget _buildInfoCard({
  //   required String title,
  //   required List<Widget> children,
  // }) {
  //   return Card(
  //     elevation: 4,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: Container(
  //       padding: const EdgeInsets.all(16.0),
  //       width: double.infinity,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           const Divider(height: 20, thickness: 1),
  //           ...children,
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildInfoRow({
  //   required IconData icon,
  //   required String label,
  //   required String value,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       children: <Widget>[
  //         Icon(icon, color: Theme.of(context).primaryColor, size: 20),
  //         const SizedBox(width: 15),
  //         Text(
  //           '$label: ',
  //           style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  //         ),
  //         Expanded(
  //           child: Text(
  //             value,
  //             style: const TextStyle(fontSize: 16),
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
