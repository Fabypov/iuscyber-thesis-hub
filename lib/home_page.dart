import 'package:flutter/material.dart';
import 'web_view_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17131F),
      body: Row(
        children: [
          // Sidebar (Desktop view simulation)
          const SidebarWidget(),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                   // Header
                   const HeaderWidget(),
                   
                   // Dashboard Content
                   Padding(
                     padding: const EdgeInsets.all(24.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // Welcome Section
                         const WelcomeSection(),
                         const SizedBox(height: 32),
                         
                         // Stats Grid
                         const StatsGrid(),
                         const SizedBox(height: 32),
                         
                         // Impact Modules
                         const SectionTitle(title: 'Módulos de Alto Impacto'),
                         const ImpactModulesGrid(),
                         const SizedBox(height: 32),
                         
                         // Lower Section: Jurisprudence and Activity
                         const LowerSection(),
                       ],
                     ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4B0082), Color(0xFF2D004F)],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.gavel, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IusCyber', 
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
                    Text('Thesis Hub', 
                      style: TextStyle(color: Colors.white70, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          _SidebarItem(icon: Icons.dashboard, title: 'Dashboard', isActive: true),
          _SidebarItem(icon: Icons.description, title: 'Mi Tesis'),
          _SidebarItem(icon: Icons.library_books, title: 'Repositorio'),
          _SidebarItem(icon: Icons.balance, title: 'Normativa'),
          _SidebarItem(icon: Icons.group, title: 'Asesoría'),
          _SidebarItem(
            icon: Icons.web, 
            title: 'Ver Proyecto Web',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewScreen(
                    url: 'https://flutter.dev', // Cambia a la URL de tu proyecto real
                    title: 'Proyecto Web IusCyber',
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF926fd8).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF926fd8).withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('MEMBRESÍA PRO', 
                    style: TextStyle(color: Color(0xFFe9e4f5), fontSize: 10, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Acceso ilimitado a jurisprudencia.', 
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF926fd8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Actualizar', style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  const _SidebarItem({
    required this.icon, 
    required this.title, 
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: isActive ? Colors.white : Colors.white70),
          title: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.white70, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
          onTap: onTap,
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF17131F).withOpacity(0.7),
        border: Border(bottom: BorderSide(color: const Color(0xFF926fd8).withOpacity(0.1))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar tesis, leyes o jurisprudencia...',
                hintStyle: TextStyle(color: const Color(0xFF926fd8).withOpacity(0.6), fontSize: 14),
                prefixIcon: Icon(Icons.search, color: const Color(0xFF926fd8).withOpacity(0.6)),
                filled: true,
                fillColor: const Color(0xFF926fd8).withOpacity(0.05),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 32),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF926fd8)),
          ),
          const SizedBox(width: 16),
          const VerticalDivider(width: 1),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Dra. Elena Ramos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text('Investigadora Senior', style: TextStyle(color: Color(0xFF926fd8), fontSize: 12)),
            ],
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            backgroundColor: Color(0xFF926fd8),
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=100'),
          ),
        ],
      ),
    );
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Panel de Mando Central', 
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF926fd8), letterSpacing: -1)),
            Text('Bienvenida de nuevo, gestiona tu avance académico hoy.', 
              style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload, size: 18),
          label: const Text('Subir Avance'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF926fd8),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 1.8,
      children: [
        _StatCard(
          title: 'Progreso Tesis',
          value: '68%',
          subtitle: '+12% este mes',
          icon: Icons.auto_stories,
          isCircular: true,
        ),
        const _StatCard(
          title: 'Similitud Turnitin',
          value: '4.2%',
          subtitle: 'Óptimo para defensa',
          icon: Icons.verified_user,
          bgColor: Color(0xFF4B0082),
          textColor: Colors.white,
        ),
        const _StatCard(
          title: 'Alertas APA 7',
          value: '12',
          subtitle: 'Citas mal formadas',
          icon: Icons.warning_amber,
          bgColor: Color(0xFF3D1616),
          textColor: Colors.redAccent,
          isAlert: true,
        ),
        const _StatCard(
          title: 'Entrega Final',
          value: '14 Días',
          subtitle: 'Progreso estimado',
          icon: Icons.timer,
          hasProgress: true,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color? bgColor;
  final Color? textColor;
  final bool isCircular;
  final bool isAlert;
  final bool hasProgress;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    this.bgColor,
    this.textColor,
    this.isCircular = false,
    this.isAlert = false,
    this.hasProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor ?? const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF926fd8).withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(color: textColor?.withOpacity(0.7) ?? Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(color: textColor ?? Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: isAlert ? Colors.redAccent : Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          if (isCircular)
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: 0.68,
                    strokeWidth: 6,
                    backgroundColor: const Color(0xFF926fd8).withOpacity(0.1),
                    color: const Color(0xFF926fd8),
                  ),
                ),
                Icon(icon, color: const Color(0xFF926fd8), size: 18),
              ],
            )
          else
            Icon(icon, color: textColor?.withOpacity(0.2) ?? const Color(0xFF926fd8).withOpacity(0.2), size: 40),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF926fd8))),
    );
  }
}

class ImpactModulesGrid extends StatelessWidget {
  const ImpactModulesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 2.2,
      children: const [
        _ModuleCard(
          title: 'Asistente IA Jurídica',
          subtitle: 'Análisis de marcos teóricos',
          icon: Icons.psychology,
          colors: [Color(0xFF926fd8), Color(0xFF4B0082)],
        ),
        _ModuleCard(
          title: 'Generador APA 7',
          subtitle: 'Citas automáticas v7.2',
          icon: Icons.menu_book,
          colors: [Color(0xFF9B51E0), Color(0xFFE040FB)],
        ),
        _ModuleCard(
          title: 'Jurisprudencia Pro',
          subtitle: 'Buscador global indexado',
          icon: Icons.account_balance_wallet,
          colors: [Color(0xFF1A237E), Color(0xFF000000)],
        ),
      ],
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;

  const _ModuleCard({required this.title, required this.subtitle, required this.icon, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white, size: 36),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class LowerSection extends StatelessWidget {
  const LowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Jurisprudence List
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Jurisprudencia Reciente', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: const Text('Ver todo', style: TextStyle(color: Color(0xFF926fd8)))),
                ],
              ),
              const SizedBox(height: 16),
              const _JurisprudenceCard(
                tag: 'Corte Constitucional',
                title: 'Sentencia T-045/24: Protección de Datos en Entornos IA',
                desc: 'La nueva jurisprudencia establece límites claros para el procesamiento de datos personales mediante algoritmos de caja negra...',
                time: 'Hace 2 días',
                isPrimary: false,
              ),
              const SizedBox(height: 16),
              const _JurisprudenceCard(
                tag: 'Reforma Laboral',
                title: 'Ley 2341: El Teletrabajo como Derecho Fundamental',
                desc: 'Análisis de la nueva normativa que redefine el vínculo laboral en la era digital y los derechos de desconexión obligatoria...',
                time: 'Hace 5 días',
                isPrimary: true,
              ),
            ],
          ),
        ),
        const SizedBox(width: 32),
        
        // Advisor Activity
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Actividad del Asesor', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF926fd8).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    const _ActivityItem(title: 'Capítulo 2 revisado', desc: '"Excelente marco teórico, revisa las citas de Kelsen"', time: 'HACE 4 HORAS', isActive: true),
                    const _ActivityItem(title: 'Sesión de Zoom', desc: 'Mañana a las 10:00 AM', time: 'PENDIENTE', isActive: false),
                    const _ActivityItem(title: 'Objetivos Aprobados', desc: 'El enfoque es correcto para el título propuesto.', time: 'AYER', isDone: true),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF926fd8)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Solicitar Tutoría', style: TextStyle(color: Color(0xFF926fd8), fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _JurisprudenceCard extends StatelessWidget {
  final String tag;
  final String title;
  final String desc;
  final String time;
  final bool isPrimary;

  const _JurisprudenceCard({required this.tag, required this.title, required this.desc, required this.time, required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(24),
        border: Border(left: BorderSide(color: isPrimary ? const Color(0xFF926fd8) : const Color(0xFF4B0082), width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF926fd8).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(tag, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF926fd8))),
              ),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton.icon(onPressed: () {}, icon: const Icon(Icons.bookmark_outline, size: 14), label: const Text('Guardar', style: TextStyle(fontSize: 12))),
              TextButton.icon(onPressed: () {}, icon: const Icon(Icons.share_outlined, size: 14), label: const Text('Compartir', style: TextStyle(fontSize: 12))),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String title;
  final String desc;
  final String time;
  final bool isActive;
  final bool isDone;

  const _ActivityItem({required this.title, required this.desc, required this.time, this.isActive = false, this.isDone = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isDone ? Colors.green : (isActive ? const Color(0xFF926fd8) : Colors.grey),
              shape: BoxShape.circle,
              boxShadow: isActive ? [BoxShadow(color: const Color(0xFF926fd8).withOpacity(0.4), blurRadius: 8, spreadRadius: 2)] : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: Color(0xFF926fd8), fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
