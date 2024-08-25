{
  ament_cmake,
  autoconf,
  automake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  libtool,
  substituteSource,
}:
let
  sources = rec {
    lely_core_libraries = substituteSource {
      src = fetchgit {
        name = "lely_core_libraries-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "a2c52c6ab8e6405d6c61adb8ba3633c923bd4dd5";
        hash = "sha256-XbLd6G2IQP4m5Fdi/04Xg1Og2BUFtPxMfonMm+uCI9g=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://gitlab.com/lely_industries/lely-core.git";
          to = "URL ${lely_core_libraries-vendor_source-lely-core-0}";
        }
      ];
    };
    lely_core_libraries-vendor_source-lely-core-0 = substituteSource {
      src = fetchgit {
        name = "lely_core_libraries-vendor_source-lely-core-0-source";
        url = "https://gitlab.com/lely_industries/lely-core.git";
        rev = "b63a0b6f79d3ea91dc221724b42dae49894449fc";
        hash = "sha256-hTLUHWJ4aRdeijo3lL6RhXAygQwKuvbFiCMw2CPuEZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lely_core_libraries";
  version = "0.2.9-2";
  src = sources.lely_core_libraries;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ git buildPackages.python3Packages.empy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ autoconf automake libtool ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS wrapper for lely-core-libraries";
  };
}
