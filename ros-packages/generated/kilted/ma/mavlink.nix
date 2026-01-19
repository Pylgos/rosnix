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
  version = "2025.12.12-1";
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
        rev = "7a34dc7f67fc2e3a0f9260413fa34d780e2fbbd4";
        hash = "sha256-OJH3SE3rk4otA4ie+S5xhXFZQyKFZeXee61j2oCkueo=";
      };
    };
  });
  meta = {
    description = "MAVLink message marshaling library.\n  This package provides C-headers and C++11 library\n  for both 1.0 and 2.0 versions of protocol.\n\n  For pymavlink use separate install via rosdep (python-pymavlink).\n  ";
  };
})
