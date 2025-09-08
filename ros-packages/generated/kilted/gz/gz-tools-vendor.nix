{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_tools_vendor";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."gz_tools_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-tools2" "ruby" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-tools2" "ruby" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_tools_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_tools_vendor-release.git";
        rev = "a9c2abdc1bc657c9d18c0132d809419cb45a760f";
        hash = "sha256-7AI3OLuTxTBZp3ZgglD6YGcVKvP8LQbHHDPPKrpJM58=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_tools_vendor/gz-tools"}";
        }
      ];
    };
    "gz_tools_vendor/gz-tools" = substituteSource {
      src = fetchgit {
        name = "gz-tools-source";
        url = "https://github.com/gazebosim/gz-tools.git";
        rev = "76a73e6c29eeaaac1c7c18a78313d053442151c8";
        hash = "sha256-TPDVluvC76X0bli8CMiCxUoAXNl/V4Cc6hrsge9ajsU=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-tools2 2.0.3\n\n    Gazebo Tools: Entrypoint to Gazebo's command line interface\n  ";
  };
})
