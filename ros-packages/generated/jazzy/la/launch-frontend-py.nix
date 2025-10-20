{
  ament-cmake,
  ament-cmake-mypy,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-copyright,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "launch_frontend_py";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."launch_frontend_py";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-cmake-mypy ament-cmake-pytest ament-copyright ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "launch_frontend_py" = substituteSource {
      src = fetchgit {
        name = "launch_frontend_py-source";
        url = "https://github.com/ros2-gbp/launch_frontend_py-release.git";
        rev = "e23d25b79b12337edcd994a28d6618d4e1fc7877";
        hash = "sha256-idp6IssWYiCoEE6exflR2JkInYfVignH4lnBHZT3VSY=";
      };
    };
  });
  meta = {
    description = "Python frontend for writing ROS 2 launch files";
  };
})
