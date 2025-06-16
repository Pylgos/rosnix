{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mavlink";
  version = "2025.6.6-1";
  src = finalAttrs.passthru.sources."mavlink";
  nativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-future" "python3-lxml" ]; };
  buildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" "python3-future" "python3-lxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mavlink" = substituteSource {
      src = fetchgit {
        name = "mavlink-source";
        url = "https://github.com/ros2-gbp/mavlink-gbp-release.git";
        rev = "12a822c6b0ca7311d7bfd80a83c5706c2e4a4574";
        hash = "sha256-JSFX+rz69W0suqC993iidyHpU6182rdiwTndEkwvnsg=";
      };
    };
  });
  meta = {
    description = "MAVLink message marshaling library.\n  This package provides C-headers and C++11 library\n  for both 1.0 and 2.0 versions of protocol.\n\n  For pymavlink use separate install via rosdep (python-pymavlink).\n  ";
  };
})
