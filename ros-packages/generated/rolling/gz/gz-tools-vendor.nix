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
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."gz_tools_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gz-tools2" "ruby" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_tools_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_tools_vendor-release.git";
        rev = "b922c4d6658f7d745786a15caac3c0db601b98f0";
        hash = "sha256-scQaHWy2trSQahhD/roz5CGnBxq/T0Epi97aF8U4WsI=";
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
        rev = "efcc504bd3665151266f38db627c9095e5a5773f";
        hash = "sha256-sV/T53oVk1fgjwqn/SRTaPTukt+vAlGGxGvTN8+G6Mo=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-tools2 2.0.1 Gazebo Tools: Entrypoint to Gazebo's command line interface";
  };
})
