{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  ecl-build,
  ecl-config,
  ecl-license,
  ecl-mpl,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_type_traits" = substituteSource {
      src = fetchgit {
        name = "ecl_type_traits-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "9344fa6b5e1d35e90a1cd7c040e3d153a8c90a47";
        hash = "sha256-s8Qksqd5xzvMghgqo0aQ6r0Oyou3x5hgXLB5t3MvZVk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_type_traits";
  version = "1.2.1-5";
  src = sources."ecl_type_traits";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ecl-mpl ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Extends c++ type traits and implements a few more to boot.";
  };
}
