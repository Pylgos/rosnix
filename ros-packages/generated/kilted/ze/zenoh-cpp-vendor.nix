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
  version = "0.6.5-1";
  src = finalAttrs.passthru.sources."zenoh_cpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cargo" "clang" "git" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cargo" "clang" "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zenoh_cpp_vendor" = substituteSource {
      src = fetchgit {
        name = "zenoh_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "f97e4cc75550f05661b482582804cc5669f8fdaf";
        hash = "sha256-gB262kdSQZch4SsYCctxK6tLXMOnQ7aH22uJLopYy9U=";
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
        rev = "8f9ce70e4c4b55d150632730fd4c48abffbde765";
        hash = "sha256-kbDIatj4GFhUyDo9yCc6FzPYszHE+Vd79w4r452p77Y=";
      };
    };
    "zenoh_cpp_vendor/zenoh-cpp" = substituteSource {
      src = fetchgit {
        name = "zenoh-cpp-source";
        url = "https://github.com/eclipse-zenoh/zenoh-cpp";
        rev = "05533d20db70ffc1d53a0e07f39caa999e82febd";
        hash = "sha256-lEicWShyKo5NSFyDeMqItZIweY3syXKF629x7woSQ0o=";
      };
    };
  });
  meta = {
    description = "Vendor pkg to install zenoh-cpp";
  };
})
