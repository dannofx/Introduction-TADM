// Ray casting algorithm

// Given a polygon and a point ‘p’, find if ‘p’ lies inside the polygon or not.
// The points lying on the border are considered inside.


extension Polygon {
    func isPointInside(_ point: Point) -> Bool {
        var intersectionsNumber = 0
        for i in 0..<self.points.count {
            let edgeP1 = self.points[i]
            let edgeP2 = self.points[(i + 1) % self.points.count]
            let edge = Segment(p1: edgeP1, p2: edgeP2)
            let rayEndPoint = Point(x: max(edgeP1.x, edgeP2.x) + 1.0, y: point.y)
            let ray = Segment(p1: point, p2: rayEndPoint)
            if edge.intersectsSegment(segment: ray) {
                if edge.liesOnSegment(point: point) {
                    return true
                }
                if edge.p1.y ==== point.y {
                    continue
                }
                if edge.p2.y ==== point.y {
                    let nextEdgeP = self.points[(i + 2) % self.points.count]
                    if edge.p2.y ==== edge.p1.y || edge.p2.y ==== nextEdgeP.y {
                        continue
                    }
                    let diff1 = edge.p2.y - edge.p1.y
                    let diff2 = edge.p2.y - nextEdgeP.y
                    if diff1 * diff2 < 0.0 {
                        continue
                    }
                }
               intersectionsNumber += 1
            }
        }
        return (intersectionsNumber % 2 != 0)
    }
}


func printIfPointInside(_ point: Point, polygon: Polygon) {
    let inside = polygon.isPointInside(point)
    let insideStr = inside ? "Yes" : "No"
    print(insideStr)
}

var points = [Point]()
points.append(Point(x: 0.0, y: 0.0))
points.append(Point(x: 10.0, y: 0.0))
points.append(Point(x: 10.0, y: 10.0))
points.append(Point(x: 0.0, y: 10.0))
var polygon = Polygon(points: points)
var targetPoint = Point(x: 20.0, y: 20.0)
printIfPointInside(targetPoint, polygon: polygon)

points = [Point]()
points.append(Point(x: 0.0, y: 0.0))
points.append(Point(x: 10.0, y: 0.0))
points.append(Point(x: 10.0, y: 10.0))
points.append(Point(x: 0.0, y: 10.0))
polygon = Polygon(points: points)
targetPoint = Point(x: 5.0, y: 5.0)
printIfPointInside(targetPoint, polygon: polygon)

points = [Point]()
points.append(Point(x: 0.0, y: 0.0))
points.append(Point(x: 5.0, y: 5.0))
points.append(Point(x: 5.0, y: 0.0))
polygon = Polygon(points: points)
targetPoint = Point(x: 3.0, y: 3.0)
printIfPointInside(targetPoint, polygon: polygon)

points = [Point]()
points.append(Point(x: 0.0, y: 0.0))
points.append(Point(x: 5.0, y: 5.0))
points.append(Point(x: 5.0, y: 0.0))
polygon = Polygon(points: points)
targetPoint = Point(x: 5.0, y: 1.0)
printIfPointInside(targetPoint, polygon: polygon)

points = [Point]()
points.append(Point(x: 0.0, y: 0.0))
points.append(Point(x: 5.0, y: 5.0))
points.append(Point(x: 5.0, y: 0.0))
polygon = Polygon(points: points)
targetPoint = Point(x: 8.0, y: 1.0)
printIfPointInside(targetPoint, polygon: polygon)

points = [Point]()
points.append(Point(x: 0.0, y: 0.0))
points.append(Point(x: 10.0, y: 0.0))
points.append(Point(x: 10.0, y: 10.0))
points.append(Point(x: 0.0, y: 10.0))
polygon = Polygon(points: points)
targetPoint = Point(x: -1.0, y: 10.0)
printIfPointInside(targetPoint, polygon: polygon)


