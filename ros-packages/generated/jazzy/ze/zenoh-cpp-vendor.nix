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
  pname = "zenoh_cpp_vendor";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."zenoh_cpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cargo" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zenoh_cpp_vendor" = substituteSource {
      src = fetchgit {
        name = "zenoh_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "cf8d3cbecebbea53335b68e04396c58d4308b3b9";
        hash = "sha256-QLOHohuU1xgzaKNXlXC/5+AI5GroZnNj27/3V3UxeaU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/eclipse-zenoh/zenoh-c.git";
          to = "VCS_TYPE path VCS_URL ${sources."zenoh_cpp_vendor/zenoh-c"}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/eclipse-zenoh/zenoh-cpp";
          to = "VCS_TYPE path VCS_URL ${sources."zenoh_cpp_vendor/zenoh-cpp"}";
        }
      ];
    };
    "zenoh_cpp_vendor/zenoh-c" = substituteSource {
      src = fetchgit {
        name = "zenoh-c-source";
        url = "https://github.com/eclipse-zenoh/zenoh-c.git";
        rev = "57d5e4d31d9b38fef34d7bcad3d3e54869c4ce73";
        hash = "sha256-e8OtpyKp+AEgh6QWD/5aBtbmDV55ocx9DeLakYdikmI=";
      };
    };
    "zenoh_cpp_vendor/zenoh-cpp" = substituteSource {
      src = fetchgit {
        name = "zenoh-cpp-source";
        url = "https://github.com/eclipse-zenoh/zenoh-cpp";
        rev = "964b64dc8b935a43147287199e7bb12da7b141e6";
        hash = "sha256-9aAWcTJU3D5R2J9fasQ1aUYXWkcCk3FcmOT340Pc0ko=";
      };
    };
  });
  meta = {
    description = "Vendor pkg to install zenoh-cpp";
  };
})
