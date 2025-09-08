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
  version = "0.4.2-1";
  src = finalAttrs.passthru.sources."automatika_embodied_agents";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" ]; };
  buildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_embodied_agents" = substituteSource {
      src = fetchgit {
        name = "automatika_embodied_agents-source";
        url = "https://github.com/ros2-gbp/automatika_embodied_agents-release.git";
        rev = "99286aafbfea61fe1b5ad59b5d389fa9cd7fe161";
        hash = "sha256-wQaj7ZtG1PZ61g4W67idtW0hZAS9EuriYm0md9aHLxM=";
      };
    };
  });
  meta = {
    description = "agents";
  };
})
