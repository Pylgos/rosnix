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
    "rmf_cmake_uncrustify" = substituteSource {
      src = fetchgit {
        name = "rmf_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/rmf_cmake_uncrustify-release.git";
        rev = "66787d123188380569a9ad1d29680caad59e36ac";
        hash = "sha256-YwXGjK9Uaj03Os5oVwylNtS6dDmirgOgm6bY+0K+8Ic=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_cmake_uncrustify";
  version = "1.2.0-5";
  src = sources."rmf_cmake_uncrustify";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test ament-uncrustify ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ament_cmake_uncrustify with support for parsing a config file.";
  };
}
