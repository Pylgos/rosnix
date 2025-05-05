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
  version = "0.0.6-1";
  src = finalAttrs.passthru.sources."gz_fuel_tools_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-fuel_tools9" "libcurl-dev" "libgflags-dev" "libjsoncpp-dev" "libyaml-dev" "libzip-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-fuel_tools9" "libcurl-dev" "libgflags-dev" "libjsoncpp-dev" "libyaml-dev" "libzip-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_fuel_tools_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_fuel_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_fuel_tools_vendor-release.git";
        rev = "d1ef669913776b2cba3f1f29dc8849cc862fde02";
        hash = "sha256-azHOZTGwbUs6hc9upFUswrT3nFGgkpxNxFC4tFxJAmI=";
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
        rev = "8bc5aa47ef5604b0ee4414699f9e36d8c8eb1db9";
        hash = "sha256-XQoBcCtzwzzPypS1kIeTCIbjtxrzaW3JvZLCYbwXAOk=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-fuel_tools9 9.1.1\n\n    Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel\n  ";
  };
})
