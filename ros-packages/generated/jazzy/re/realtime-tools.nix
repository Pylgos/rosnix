{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "realtime_tools" = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "e3806700b4d5424d40e8d2704b8dff934265b9c6";
        hash = "sha256-O+JIb/Nj1NVKgFsEAEvpf/tYJG74a6ApfkNiFOzlM0s=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "realtime_tools";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."realtime_tools";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock lifecycle-msgs rclcpp-lifecycle test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
})
