{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "lifecycle_py";
  version = "0.33.8-1";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedNativeBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "989fb9cb7db81a05eac3bc951db50a7a073594dd";
        hash = "sha256-BxArvK6V59LBdHJpabcPKvDEDxUMdqddB837x8/OTfE=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
