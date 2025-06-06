{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nao-lola-command-msgs,
  nao-lola-sensor-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_lola_client";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."nao_lola_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nao-lola-command-msgs nao-lola-sensor-msgs rcl-interfaces rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nao-lola-command-msgs nao-lola-sensor-msgs rcl-interfaces rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_lola_client" = substituteSource {
      src = fetchgit {
        name = "nao_lola_client-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "c81a45165ab9fa279a5a60509cf97db5c2a31b15";
        hash = "sha256-EC4It9qdpgQxnpVxErStgFzOy5Uq4NCqJ4mbwm4CWjk=";
      };
    };
  });
  meta = {
    description = "Packages that allow communicating with the NAO's Lola middle-ware.";
  };
})
