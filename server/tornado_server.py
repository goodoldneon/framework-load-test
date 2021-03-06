import tornado.ioloop
import tornado.web


class MainHandler(tornado.web.RequestHandler):
    async def get(self):
        self.write("Hello from Tornado!")


def make_app():
    return tornado.web.Application(
        [
            (r"/", MainHandler),
        ]
    )


if __name__ == "__main__":
    app = make_app()
    app.listen(8080)
    tornado.ioloop.IOLoop.current().start()
