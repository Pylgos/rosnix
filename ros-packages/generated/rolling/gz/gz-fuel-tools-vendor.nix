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
  gz-common-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_fuel_tools_vendor";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."gz_fuel_tools_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-fuel_tools10" "libcurl-dev" "libgflags-dev" "libjsoncpp-dev" "libyaml-dev" "libzip-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_fuel_tools_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_fuel_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_fuel_tools_vendor-release.git";
        rev = "72f664f589c0461e087b37fbc9186dfba37f3621";
        hash = "sha256-MJLvbIBIph2f6hJpR2sjF+lU5N47CT/D4Igl0iRCgrY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_fuel_tools_vendor/gz-fuel-tools"}";
        }
      ];
    };
    "gz_fuel_tools_vendor/gz-fuel-tools" = substituteSource {
      src = fetchgit {
        name = "gz-fuel-tools-source";
        url = "https://github.com/gazebosim/gz-fuel-tools.git";
        rev = "93803c78dc55a978e39dfbb2a89d47585ff3c999";
        hash = "sha256-9WskZnci7D09aW32lzmdtlhRBM+hcmhG6iNgf3OC1js=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-fuel_tools10 10.0.0 Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel";
  };
})
