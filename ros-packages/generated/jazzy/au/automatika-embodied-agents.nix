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
  version = "0.7.1-1";
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
        rev = "6510de35257c0490b7b4b2185907ed462124f18e";
        hash = "sha256-p2l1QmoNGjEoKjGs7Xj9B+7yiRnKwMGIHywcCoMR/8g=";
      };
    };
  });
  meta = {
    description = "agents";
  };
})
