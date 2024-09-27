{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    lely_core-vendor_source-b63a0b6f79d3ea91dc221724b42dae49894449fc = substituteSource {
      src = fetchgit {
        name = "lely_core-vendor_source-b63a0b6f79d3ea91dc221724b42dae49894449fc-source";
        url = "https://gitlab.com/lely_industries/lely-core.git";
        rev = "b63a0b6f79d3ea91dc221724b42dae49894449fc";
        hash = "sha256-hTLUHWJ4aRdeijo3lL6RhXAygQwKuvbFiCMw2CPuEZE=";
      };
      substitutions = [
      ];
    };
    lely_core_libraries-e22a243a74dbede44dc6a6d4dba99998f73e5962 = substituteSource {
      src = fetchgit {
        name = "lely_core_libraries-e22a243a74dbede44dc6a6d4dba99998f73e5962-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "e22a243a74dbede44dc6a6d4dba99998f73e5962";
        hash = "sha256-jB0RhzZAX+iFzZL0aKZhwW5RpYm7rBiI2N/Tx/0lc64=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://gitlab.com/lely_industries/lely-core.git";
          to = "URL ${lely_core-vendor_source-b63a0b6f79d3ea91dc221724b42dae49894449fc}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "lely_core_libraries";
  version = "0.2.12-2";
  src = sources.lely_core_libraries-e22a243a74dbede44dc6a6d4dba99998f73e5962;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-empy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "autoconf" "automake" "libtool" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS wrapper for lely-core-libraries";
  };
}
