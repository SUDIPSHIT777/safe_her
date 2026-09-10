import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyActions extends StatelessWidget {
  const EmergencyActions({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 16),
      decoration: BoxDecoration(
        color: themeColor.onPrimary,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: themeColor.primary),
      ),
      child: Column(
        children: [
          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                'EMERGENCY ACTIONS',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: themeColor.onSurfaceVariant,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmergencyButton(
                size: 80,
                icon: Icons.mic,
                text: 'VOICE',
                onTap: () {},
              ),

              EmergencyButton(size: 90, text: 'SOS', isSOS: true, onTap: () {}),

              EmergencyButton(
                size: 80,
                icon: Icons.local_police,
                text: 'POLICE',
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            'Emergency call will start automatically and\nlocation will be shared.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10,
              height: 1.5,
              color: themeColor.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyButton extends StatefulWidget {
  final double size;
  final IconData? icon;
  final String text;
  final bool isSOS;
  final VoidCallback onTap;

  const EmergencyButton({
    super.key,
    required this.size,
    this.icon,
    required this.text,
    required this.onTap,
    this.isSOS = false,
  });

  @override
  State<EmergencyButton> createState() => _EmergencyButtonState();
}

class _EmergencyButtonState extends State<EmergencyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _pulseAnimation;
  late Animation<double> _rippleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rippleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.55,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _glowAnimation = Tween<double>(
      begin: 8,
      end: 25,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isSOS) {
      return GestureDetector(onTap: widget.onTap, child: _buildButton());
    }
    return SizedBox(
      width: widget.size * 1.6,
      height: widget.size * 1.6,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final opacity = (1 - _controller.value).clamp(0.0, 1.0);

          return Stack(
            alignment: Alignment.center,
            children: [
              // Ripple circle
              Transform.scale(
                scale: _rippleAnimation.value,
                child: Opacity(
                  opacity: opacity * 0.35,
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE91E3D),
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),

              // Second ripple
              Transform.scale(
                scale: 1 + (_rippleAnimation.value - 1) * 0.7,
                child: Opacity(
                  opacity: opacity * 0.2,
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFF5A6F),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              // Main SOS Button
              Transform.scale(
                scale: _pulseAnimation.value,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFF5A6F), Color(0xFFE91E3D)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFE91E3D,
                          ).withValues(alpha: 0.45),
                          blurRadius: _glowAnimation.value,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF5A6F), Color(0xFFE91E3D)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE91E3D).withValues(alpha: .25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: Colors.white, size: 30),
          const SizedBox(height: 5),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
