{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lely_core_libraries";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."lely_core_libraries";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-empy" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "autoconf" "automake" "libtool" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lely_core_libraries" = substituteSource {
      src = fetchgit {
        name = "lely_core_libraries-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "4aa6e8744fe9be1cd22b384a6db0937e379a3530";
        hash = "sha256-Q42ibxR4A7Cfh3vVjmCUwKG7a5p6Vv9qQ51FGXs+Edc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://gitlab.com/lely_industries/lely-core.git";
          to = "URL ${sources."lely_core_libraries/lely-core"}";
        }
      ];
    };
    "lely_core_libraries/lely-core" = substituteSource {
      src = fetchgit {
        name = "lely-core-source";
        url = "https://gitlab.com/lely_industries/lely-core.git";
        rev = "b63a0b6f79d3ea91dc221724b42dae49894449fc";
        hash = "sha256-hTLUHWJ4aRdeijo3lL6RhXAygQwKuvbFiCMw2CPuEZE=";
      };
    };
  });
  meta = {
    description = "ROS wrapper for lely-core-libraries";
  };
})
