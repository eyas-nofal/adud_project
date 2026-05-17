import 'package:adud_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Partner {
  final String name;
  final String imagePath; // Path to image asset, or use an Icon if empty
  final Color backgroundColor;

  const Partner({
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
  });
}

class PartnersSection extends StatefulWidget {
  final List<Partner> partners;

  const PartnersSection({
    super.key,
    required this.partners,
  });

  @override
  State<PartnersSection> createState() => _PartnersSectionState();
}

class _PartnersSectionState extends State<PartnersSection>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late Ticker _ticker;
  Duration _lastElapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Setup Ticker for smooth, continuous automatic scrolling
    _ticker = createTicker((elapsed) {
      final delta = elapsed - _lastElapsed;
      _lastElapsed = elapsed;

      // Ensure there are clients and items to scroll
      if (_scrollController.hasClients && widget.partners.isNotEmpty) {
        // ~40 pixels per second for a smooth marquee effect
        final offset =
            _scrollController.offset + (40 * delta.inMicroseconds / 1000000);
        _scrollController.jumpTo(offset);
      }
    });

    // Start ticker after a small delay to let layout build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _ticker.start();
        }
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Semantics(
      label: 'قسم الشركاء والداعمين',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- Header ---
          Text(
            loc.partnersAndSupporters,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            loc.proudSupportAndPartnership,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 24),

          // --- Auto-Scrolling List ---
          SizedBox(
            height: 150,
            child: widget.partners.isEmpty
                ? const SizedBox()
                : ExcludeSemantics(
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      // Disable manual scrolling to keep smooth continuous loop intact
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // Modulo logic for infinite looping
                        final partner =
                            widget.partners[index % widget.partners.length];
                        return _buildPartnerCard(partner);
                      },
                    ),
                  ),
          ),
          const SizedBox(height: 24),

          // --- Bottom Banner ---
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade50,
                  Colors.purple.shade50,
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loc.togetherWeMakeDifference,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.favorite,
                        color: Color(0xFF4299E1), size: 20),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  loc.thanksForCommunitySupport,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerCard(Partner partner) {
    return Container(
      width: 130, // Fixed width for each card
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Colored background image container
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                color: partner.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: partner.imagePath.isNotEmpty
                    ? Image.asset(
                        partner.imagePath,
                        width: 70,
                        height: 70,
                        errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.business,
                            size: 40,
                            color: Colors.black.withValues(alpha: 0.3)),
                      )
                    : Icon(Icons.business,
                        size: 40, color: Colors.black.withValues(alpha: 0.3)),
              ),
            ),
          ),
          // Label area
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  partner.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
