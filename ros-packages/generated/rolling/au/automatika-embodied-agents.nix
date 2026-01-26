{
  ament-cmake,
  ament-cmake-python,
  automatika-ros-sugar,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "automatika_embodied_agents";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."automatika_embodied_agents";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" "python3-websockets" ]; };
  buildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" "python3-websockets" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_embodied_agents" = substituteSource {
      src = fetchgit {
        name = "automatika_embodied_agents-source";
        url = "https://github.com/ros2-gbp/automatika_embodied_agents-release.git";
        rev = "ceee01562340340376493084dd8128e6a4635f38";
        hash = "sha256-BgmueolCd3lESmNdF4Lro5toMD9anLbDw/zPKk84j3I=";
      };
    };
  });
  meta = {
    description = "agents";
  };
})
