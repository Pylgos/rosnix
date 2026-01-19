{
  ament-cmake-pytest,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  builtin-interfaces,
  easynav-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "easynav_support_py";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."easynav_support_py";
  propagatedNativeBuildInputs = [ builtin-interfaces easynav-interfaces geometry-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ builtin-interfaces easynav-interfaces geometry-msgs rclpy std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "easynav_support_py" = substituteSource {
      src = fetchgit {
        name = "easynav_support_py-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "b4271d60131b892ea41e4c5d881e4d8e09c7385b";
        hash = "sha256-p686/02wRz3Nw0aEVcFcPmU9fBkDxDnbyKt9mCBESr8=";
      };
    };
  });
  meta = {
    description = "Support utilities for EasyNav in Python: GoalManagerClient and tests.";
  };
})
