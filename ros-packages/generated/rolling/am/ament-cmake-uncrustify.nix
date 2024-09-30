{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "efebef7b70c55c2f4001c5955c5b06d06a736a19";
        hash = "sha256-K+nAwXcoj7oyJgT+1aLuomdj6Y9zjGP6P7Lq9ZKU1pY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_uncrustify";
  version = "0.18.1-1";
  src = sources."ament_cmake_uncrustify";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test ament-uncrustify ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-test ament-uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_uncrustify to check code against styleconventions using uncrustify.";
  };
}
