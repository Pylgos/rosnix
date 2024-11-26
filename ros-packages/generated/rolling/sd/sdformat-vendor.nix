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
  gz-math-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdfdom,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdformat_vendor";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."sdformat_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "sdformat15" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" "python3-psutil" "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "sdformat_vendor" = substituteSource {
        src = fetchgit {
          name = "sdformat_vendor-source";
          url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
          rev = "ffa1d275d49a6b31058495b136301f6925e4e8c0";
          hash = "sha256-xWSyBjF9TNsJ0LtKJ/r1H96EsjRb5snQ9AaZsWGyDpc=";
        };
        substitutions = [
          {
            path = "CMakeLists.txt";
            from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
            to = "VCS_TYPE path VCS_URL ${sources."sdformat_vendor/sdformat"}";
          }
        ];
      };
      "sdformat_vendor/sdformat" = substituteSource {
        src = fetchgit {
          name = "sdformat-source";
          url = "https://github.com/gazebosim/sdformat.git";
          rev = "e40c32f3d39554bdda361e0467219b4da48032f9";
          hash = "sha256-59spzVnuKamIKFIItEx0K5+otuef1LVHp0U7u0UaA8o=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for: sdformat15 15.1.0 SDFormat is an XML file format that describes environments, objects, and robots in a manner suitable for robotic applications";
  };
})
