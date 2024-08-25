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
        rev = "e22a243a74dbede44dc6a6d4dba99998f73e5962";
        hash = "sha256-jB0RhzZAX+iFzZL0aKZhwW5RpYm7rBiI2N/Tx/0lc64=";
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
  version = "0.2.12-2";
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
