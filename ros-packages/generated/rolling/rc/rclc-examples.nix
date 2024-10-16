{
  ament-cmake-ros,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rcl,
  rclc,
  rclc-lifecycle,
  rclc-parameter,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rclc_examples" = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "c91af81f6642d783126c29f37983b57dd5be7785";
        hash = "sha256-SC9LbRxorM55xg8sK9pDm235fnw5UvYahla7aUvq7e0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_examples";
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."rclc_examples";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rcl rclc rclc-lifecycle rclc-parameter std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Example of using rclc_executor";
  };
})
