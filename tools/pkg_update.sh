#@COPYRIGHT@


echo "hpcports:  Updating package list..."

echo "# This file auto-generated by \"make update\" " > ports/pkg_list.make

pkgs=""

for entry in `ls ports`; do
	if [ -d ports/${entry} ]; then
		pkgs="${pkgs} ${entry}"
	fi
done

echo "PKGS =${pkgs}" >> ports/pkg_list.make


echo "hpcports:  Computing package dependencies..."

echo "# This file auto-generated by \"make update\" " > ports/pkg_deps.make

for pkg in ${pkgs}; do
	deps=`head -n 1 ports/${pkg}/deps`
	echo "${pkg} : ${deps}" >> ports/pkg_deps.make
done


echo "hpcports:  Generating package build rules..."

echo "# This file auto-generated by \"make update\" " > ports/pkg_rules.make

for pkg in ${pkgs}; do
	echo "" >> ports/pkg_rules.make
	echo "${pkg} :" >> ports/pkg_rules.make
	echo "\t@if test \"x\$(${pkg}_OVERRIDE)\" = \"x\"; then \\" >> ports/pkg_rules.make
	echo "\t\tcd ports/${pkg}; \$(MAKE) install; \\" >> ports/pkg_rules.make
	echo "\tfi" >> ports/pkg_rules.make

	echo "" >> ports/pkg_rules.make
	echo "${pkg}-clean :" >> ports/pkg_rules.make
	echo "\t@if test \"x\$(${pkg}_OVERRIDE)\" = \"x\"; then \\" >> ports/pkg_rules.make
	echo "\t\tcd ports/${pkg}; \$(MAKE) clean; \\" >> ports/pkg_rules.make
	echo "\tfi" >> ports/pkg_rules.make

	echo "" >> ports/pkg_rules.make
	echo "${pkg}-purge :" >> ports/pkg_rules.make
	echo "\t@if test \"x\$(${pkg}_OVERRIDE)\" = \"x\"; then \\" >> ports/pkg_rules.make
	echo "\t\tcd ports/${pkg}; \$(MAKE) purge; \\" >> ports/pkg_rules.make
	echo "\tfi" >> ports/pkg_rules.make
done
echo "" >> ports/pkg_rules.make


echo "STALE = FALSE" > ports/pkg_stale.make


