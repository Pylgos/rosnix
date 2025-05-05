{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "boost_sml_vendor";
  version = "1.1.11-1";
  src = finalAttrs.passthru.sources."boost_sml_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "boost_sml_vendor" = substituteSource {
      src = fetchgit {
        name = "boost_sml_vendor-source";
        url = "https://github.com/ros2-gbp/boost_sml_vendor-release.git";
        rev = "571c7fff9b590ec16e68be2260811360a7016375";
        hash = "sha256-qs5eZiNEyTfscGhvBFMZhQBY6G87wVSR23YymRK9kvw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE git";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/boost-ext/sml.git";
          to = "VCS_TYPE path VCS_URL ${sources."boost_sml_vendor/sml"}";
        }
      ];
    };
    "boost_sml_vendor/sml" = substituteSource {
      src = fetchgit {
        name = "sml-source";
        url = "https://github.com/boost-ext/sml.git";
        rev = "b7df6180d20422b2724d26007aebb24066f2a6a9";
        hash = "sha256-/eR/B8rE+mh5zDPjx1kS9nVJf1rCeHP04QDavh6z6fM=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for the Boost SML (State Machine Language)\n  ";
  };
})
