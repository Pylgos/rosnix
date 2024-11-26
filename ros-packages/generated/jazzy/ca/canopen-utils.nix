{
  ament-lint-auto,
  buildAmentPythonPackage,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "canopen_utils";
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_utils";
  propagatedBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_utils" = substituteSource {
        src = fetchgit {
          name = "canopen_utils-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "181beef157c2ca0a620517759160ed38a96b752b";
          hash = "sha256-6Wm4mQlXmkNgHkDqu2NDjeeA/4QXqqxc0vWdyftHwgc=";
        };
      };
    });
  };
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
})
